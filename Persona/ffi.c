#include <string.h>
#include <curl/curl.h>
#include <jansson.h>
#include <urweb.h>
#include "ffi.h"

#define BUF_INIT 1024
#define BUF_MAX 1073741824

/* Perform HTTP requests using libcurl and storing data
   in the Ur/Web request context. Based on code from:
   http://hg.impredicative.com/openid
*/
uw_unit uw_Ffi_init(uw_context ctx)
{
  curl_global_init(CURL_GLOBAL_ALL);

  return uw_unit_v;
}

static CURL *curl(uw_context ctx)
{
  CURL *r;

  if (!(r = uw_get_global(ctx, "curl"))) {
    r = curl_easy_init();
    if (r)
      uw_set_global(ctx, "curl", r, curl_easy_cleanup);
  }

  return r;
}

static void free_buffer(void *data)
{ 
  uw_buffer *buf = data;
  uw_buffer_free(buf);
  free(buf);
}

static uw_buffer *curl_buffer(uw_context ctx)
{
  uw_buffer *r;

  if (!(r = uw_get_global(ctx, "curl_buffer"))) {
    r = malloc(sizeof(uw_buffer));
    if (r) {
      uw_buffer_init(BUF_MAX, r, BUF_INIT);
      uw_set_global(ctx, "curl_buffer", r, free_buffer);
    }
  }

  return r;
}

static size_t write_data(void *buffer, size_t size, size_t nmemb, void *userp)
{
  uw_buffer *out = userp;

  uw_buffer_append(out, buffer, size * nmemb);

  return size * nmemb;
}

/* Make an HTTP POST request using libcurl */
uw_Basis_string uw_Ffi_http_post(uw_context ctx, uw_Basis_string url, uw_Basis_string post)
{
  CURL *c = curl(ctx);
  uw_buffer *b = curl_buffer(ctx);
  CURLcode code;

  uw_buffer_reset(b);

  curl_easy_setopt(c, CURLOPT_URL, url);
  curl_easy_setopt(c, CURLOPT_WRITEFUNCTION, write_data);
  curl_easy_setopt(c, CURLOPT_WRITEDATA, b);
  curl_easy_setopt(c, CURLOPT_POST, 1);
  curl_easy_setopt(c, CURLOPT_POSTFIELDS, post);
  curl_easy_setopt(c, CURLOPT_POSTFIELDSIZE, strlen(post));
  curl_easy_setopt(c, CURLOPT_SSL_VERIFYPEER, 1);
  curl_easy_setopt(c, CURLOPT_SSL_VERIFYHOST, 2);
  curl_easy_setopt(c, CURLOPT_VERBOSE, 1);

  code = curl_easy_perform(c);

  if (code)
    return NULL;
  else {
    uw_buffer_append(b, "", 1);
    return uw_strdup(ctx, b->start);
  }
}

/* Use libjansson to retrieve the value at the given key in the JSON string */
uw_Basis_string uw_Ffi_json_get_string(uw_context ctx, uw_Basis_string json, uw_Basis_string key)
{
  json_error_t e;
  json_t* o = json_loads(json, 0, &e);
  if (!o) { return NULL; }

  json_t* result = json_object_get(o, key);
  if (!result) { json_decref(o); return NULL; }

  if (!json_is_string(result)) { json_decref(o); return NULL; }
  char* a = uw_strdup(ctx, json_string_value(result));
  json_decref(o);
  return a;
}

