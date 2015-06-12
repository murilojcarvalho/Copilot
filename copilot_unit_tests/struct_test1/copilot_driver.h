#include <stdio.h>
#include "copilot-c99-codegen/copilot.h"

int atm_trigger_count = 0;

void trigger1()
{
	//printf("The trigger has been evoked!\n");
	++atm_trigger_count;
}
