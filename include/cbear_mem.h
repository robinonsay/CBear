#ifndef CBEAR_MEM_H
#define CBEAR_MEM_H

#include "cbear_types.h"

void* CBearMalloc(size_t szSize);
void CBearFree(void* vPtr);

#endif
