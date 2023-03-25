/******************************************************************************
*
* Engineer: Kishore Bachu
* Date: 25th March 2023
* Program: LED Toggling on Pynq-Z2 FPGA board
* UART Baud Rate: 115200
*
******************************************************************************/

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xgpio.h"
#include "xparameters.h"
#include <time.h>

XGpio led_4bits;
XGpio COUNT_EN;

//Function to initialize GPIOs
void init_gpio()
{
	int status1;
	int status2;

	status1 = XGpio_Initialize(&led_4bits, XPAR_AXI_GPIO_0_DEVICE_ID);
	status2 = XGpio_Initialize(&COUNT_EN, XPAR_AXI_GPIO_0_DEVICE_ID);

	if ((status1 && status2) == XST_SUCCESS)
		xil_printf("GPIO Initialization is SUCCESS \n");
	else
		xil_printf("GPIO Initialization FAILED \n");
}

int main()
{

	u32 swInput; //SW1 input
	int count = 0x0;

	//Initialize platform
    init_platform();

    //Initialize GPIO function
    init_gpio();

    //Data Direction for led_4bits. Channel = 1. DirectionMask = 0 (output)
    //XGpio_SetDataDirection(InstancePtr, Channel, DirectionMask)
    XGpio_SetDataDirection(&led_4bits, 1, 0);

    //Data Direction for COUNT_EN. Channel = 2. DirectionMask = 1 (input)
    //XGpio_SetDataDirection(InstancePtr, Channel, DirectionMask)
    XGpio_SetDataDirection(&COUNT_EN, 2, 1);

    while(1)
    {
    	swInput = XGpio_DiscreteRead(&COUNT_EN, 2);	//Read SW1 input
    	if (swInput == 1)	//If SW1 is enabled
    	{
    		xil_printf("Switch SW1 is Enabled \n");
    		for (count = 0; count <= 0xf; count++)
    		{
    		XGpio_DiscreteWrite(&led_4bits, 1, count);
    		sleep(1);
    		}
    	}
    	else
    	{
    		xil_printf("Switch SW1 is Disabled \n");
    		XGpio_DiscreteWrite(&led_4bits, 1, 0x0);
    		//sleep(1);
    	}
    }

    cleanup_platform();
    return 0;
}
