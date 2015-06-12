#include <stdio.h>
#include <assert.h>
#include "copilot_struct_test1.h"
#include "copilot_driver.h"

float temp = 1.1;
bool running = true;

void verify()
{
	assert(ut_debug_temps == debug_temps);
	assert(ut_trigger_count == atm_trigger_count);
}

int main(int argc, char** argv)
{
	ut_initData();
	int i;
	for(i = 0; i < RNDS; ++i)
	{
		//printf("iteration: %d\n", i);
		//printf("ut temp: %f\n", ut_debug_temps);
		//printf("atm temp: %f\n", atm_debug_temps);
		temp = temp * 1.3;
		ut_execute();
		step();
		verify();
	}
	printf("************************************\n");
	printf("Passed Copilot Struct Test1\n");
	printf("************************************\n");
	return 0;
}
