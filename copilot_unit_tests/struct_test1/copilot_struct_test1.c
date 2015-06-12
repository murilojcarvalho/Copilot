#include <stdio.h>
#include "copilot_struct_test1.h"

float ut_debug_temps = 0.0;
int ut_trigger_count = 0;

void ut_initData()
{
	test.running = true;
	int i;
	for(i = 0; i < SIZE; ++i)
	{
		test.temps[i] = MAX;
	}
}

void ut_trigger1()
{
	//printf("The trigger has been evoked!\n");
	++ut_trigger_count;
}

void ut_execute()
{
	if(test.running && (test.temps[0] + THRESHOLD < test.temps[SIZE-1]))
	{
		ut_trigger1();
	}

	ut_debug_temps = test.temps[0];

	int i;
	for(i = 1; i < SIZE; ++i)
	{
		test.temps[i-1] = test.temps[i];
	}
	test.temps[SIZE-1] = temp;
}
