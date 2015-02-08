/* http://stupefydeveloper.blogspot.ru/2008/08/cc-embed-binary-data-into-elf.html */
#include <urweb.h>
#include <stdio.h>
#include "BSM1_css_c.h"

#define BLOBSZ 44
static char blob[BLOBSZ];

uw_Basis_blob uw_BSM1_css_c_blob (uw_context ctx, uw_unit unit)
{
  uw_Basis_blob uwblob;
  uwblob.data = &blob[0];
  uwblob.size = BLOBSZ;
  return uwblob;
}

uw_Basis_string uw_BSM1_css_c_text (uw_context ctx, uw_unit unit) {
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
0x2E ,0x73 ,0x6C ,0x69 ,0x64 ,0x65 ,0x72 ,0x2D ,0x73 ,0x65 ,0x6C ,0x65 ,0x63 ,0x74 ,0x69 ,0x6F ,0x6E ,0x20 ,0x7B ,0x0A ,0x09 ,0x62 ,0x61 ,0x63 ,0x6B ,0x67 ,0x72 ,0x6F ,0x75 ,0x6E ,0x64 ,0x3A ,0x20 ,0x23 ,0x42 ,0x41 ,0x42 ,0x41 ,0x42 ,0x41 ,0x3B ,0x0A ,0x7D ,0x0A ,};

