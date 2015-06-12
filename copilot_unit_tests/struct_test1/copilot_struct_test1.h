#include <stdbool.h>
#include "struct1.h"

#define MAX 500
#define THRESHOLD 2.3
#define RNDS 10

extern float temp;
extern float ut_debug_temps;
extern int ut_trigger_count;
struct data test;

void ut_initData();
void ut_trigger1();
void ut_execute();
