/* Thanks, http://stupefydeveloper.blogspot.ru/2008/08/cc-embed-binary-data-into-elf.html */
#include <urweb.h>
#include <stdio.h>
#define BLOBSZ 428
static char blob[BLOBSZ];
uw_Basis_blob uw_Tooltip_js_c_binary (uw_context ctx, uw_unit unit)
{
  uw_Basis_blob uwblob;
  uwblob.data = &blob[0];
  uwblob.size = BLOBSZ;
  return uwblob;
}

uw_Basis_string uw_Tooltip_js_c_text (uw_context ctx, uw_unit unit) {
  char* data = &blob[0];
  size_t size = sizeof(blob);
  char * c = uw_malloc(ctx, size+1);
  char * write = c;
  int i;
  for (i = 0; i < size; i++) {
    *write =  data[i];
    if (*write == '\0')
      *write = '\n';
    *write++;
  }
  *write=0;
  return c;
  }


static char blob[BLOBSZ] = {
0x0A ,0x0A ,0x66 ,0x75 ,0x6E ,0x63 ,0x74 ,0x69 ,0x6F ,0x6E ,0x20 ,0x65 ,0x6E ,0x61 ,0x62 ,0x6C ,0x65 ,0x5F ,0x74 ,0x6F ,0x6F ,0x6C ,0x74 ,0x69 ,0x70 ,0x73 ,0x5F ,0x5F ,0x75 ,0x6E ,0x69 ,0x74 ,0x28 ,0x75 ,0x6E ,0x69 ,0x74 ,0x29 ,0x20 ,0x7B ,0x0A ,0x20 ,0x20 ,0x24 ,0x28 ,0x27 ,0x5B ,0x64 ,0x61 ,0x74 ,0x61 ,0x2D ,0x74 ,0x6F ,0x67 ,0x67 ,0x6C ,0x65 ,0x3D ,0x22 ,0x74 ,0x6F ,0x6F ,0x6C ,0x74 ,0x69 ,0x70 ,0x22 ,0x5D ,0x27 ,0x29 ,0x2E ,0x74 ,0x6F ,0x6F ,0x6C ,0x74 ,0x69 ,0x70 ,0x28 ,0x7B ,0x27 ,0x70 ,0x6C ,0x61 ,0x63 ,0x65 ,0x6D ,0x65 ,0x6E ,0x74 ,0x27 ,0x3A ,0x20 ,0x27 ,0x74 ,0x6F ,0x70 ,0x27 ,0x7D ,0x29 ,0x3B ,0x0A ,0x7D ,0x0A ,0x0A ,0x66 ,0x75 ,0x6E ,0x63 ,0x74 ,0x69 ,0x6F ,0x6E ,0x20 ,0x70 ,0x6F ,0x70 ,0x6F ,0x76 ,0x65 ,0x72 ,0x5F ,0x5F ,0x75 ,0x6E ,0x69 ,0x74 ,0x28 ,0x69 ,0x64 ,0x5F ,0x5F ,0x73 ,0x74 ,0x72 ,0x69 ,0x6E ,0x67 ,0x2C ,0x20 ,0x74 ,0x65 ,0x78 ,0x74 ,0x5F ,0x5F ,0x73 ,0x74 ,0x72 ,0x69 ,0x6E ,0x67 ,0x29 ,0x20 ,0x7B ,0x0A ,0x20 ,0x20 ,0x24 ,0x28 ,0x69 ,0x64 ,0x5F ,0x5F ,0x73 ,0x74 ,0x72 ,0x69 ,0x6E ,0x67 ,0x29 ,0x2E ,0x70 ,0x6F ,0x70 ,0x6F ,0x76 ,0x65 ,0x72 ,0x28 ,0x7B ,0x27 ,0x73 ,0x68 ,0x6F ,0x77 ,0x27 ,0x3A ,0x74 ,0x72 ,0x75 ,0x65 ,0x2C ,0x20 ,0x27 ,0x74 ,0x69 ,0x74 ,0x6C ,0x65 ,0x27 ,0x20 ,0x3A ,0x20 ,0x74 ,0x65 ,0x78 ,0x74 ,0x5F ,0x5F ,0x73 ,0x74 ,0x72 ,0x69 ,0x6E ,0x67 ,0x2C ,0x20 ,0x27 ,0x70 ,0x6C ,0x61 ,0x63 ,0x65 ,0x6D ,0x65 ,0x6E ,0x74 ,0x27 ,0x20 ,0x3A ,0x20 ,0x27 ,0x74 ,0x6F ,0x70 ,0x27 ,0x7D ,0x29 ,0x3B ,0x0A ,0x20 ,0x20 ,0x24 ,0x28 ,0x69 ,0x64 ,0x5F ,0x5F ,0x73 ,0x74 ,0x72 ,0x69 ,0x6E ,0x67 ,0x29 ,0x2E ,0x70 ,0x6F ,0x70 ,0x6F ,0x76 ,0x65 ,0x72 ,0x28 ,0x27 ,0x73 ,0x68 ,0x6F ,0x77 ,0x27 ,0x29 ,0x3B ,0x0A ,0x7D ,0x0A ,0x0A ,0x66 ,0x75 ,0x6E ,0x63 ,0x74 ,0x69 ,0x6F ,0x6E ,0x20 ,0x74 ,0x6F ,0x6F ,0x6C ,0x74 ,0x69 ,0x70 ,0x5F ,0x5F ,0x75 ,0x6E ,0x69 ,0x74 ,0x28 ,0x69 ,0x64 ,0x5F ,0x5F ,0x73 ,0x74 ,0x72 ,0x69 ,0x6E ,0x67 ,0x2C ,0x20 ,0x74 ,0x65 ,0x78 ,0x74 ,0x5F ,0x5F ,0x73 ,0x74 ,0x72 ,0x69 ,0x6E ,0x67 ,0x29 ,0x20 ,0x7B ,0x0A ,0x20 ,0x20 ,0x24 ,0x28 ,0x69 ,0x64 ,0x5F ,0x5F ,0x73 ,0x74 ,0x72 ,0x69 ,0x6E ,0x67 ,0x29 ,0x2E ,0x74 ,0x6F ,0x6F ,0x6C ,0x74 ,0x69 ,0x70 ,0x28 ,0x7B ,0x27 ,0x73 ,0x68 ,0x6F ,0x77 ,0x27 ,0x3A ,0x74 ,0x72 ,0x75 ,0x65 ,0x2C ,0x20 ,0x27 ,0x74 ,0x69 ,0x74 ,0x6C ,0x65 ,0x27 ,0x20 ,0x3A ,0x20 ,0x74 ,0x65 ,0x78 ,0x74 ,0x5F ,0x5F ,0x73 ,0x74 ,0x72 ,0x69 ,0x6E ,0x67 ,0x7D ,0x29 ,0x3B ,0x0A ,0x20 ,0x20 ,0x24 ,0x28 ,0x69 ,0x64 ,0x5F ,0x5F ,0x73 ,0x74 ,0x72 ,0x69 ,0x6E ,0x67 ,0x29 ,0x2E ,0x74 ,0x6F ,0x6F ,0x6C ,0x74 ,0x69 ,0x70 ,0x28 ,0x27 ,0x73 ,0x68 ,0x6F ,0x77 ,0x27 ,0x29 ,0x3B ,0x0A ,0x7D ,0x0A ,};
