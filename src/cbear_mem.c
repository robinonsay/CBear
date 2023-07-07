#include "cbear_mem.h"
#include <stdlib.h>

void* CBearMalloc(size_t szSize)
{
    return malloc(szSize);
}

void CBearFree(void* vPtr)
{
    free(vPtr);
}

