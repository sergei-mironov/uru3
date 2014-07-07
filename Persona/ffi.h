#include <urweb.h>

/* Make an HTTP post request to the given URL. 'post' should contain the HTTP form
   data. Returns NULL on failure and the result from the URL on success. */
uw_Basis_string uw_Ffi_http_post(uw_context ctx, uw_Basis_string url, uw_Basis_string post);

/* 'json' is expected to be a valid string of JSON data. Returns the string contained at
   the 'key' in the JSON object. If the JSON is invalid or the key does not exist, returns
   NULL */
uw_Basis_string uw_Ffi_json_get_string(uw_context ctx, uw_Basis_string json, uw_Basis_string key);


