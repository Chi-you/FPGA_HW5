#include <stdio.h>
#include "xil_printf.h"
#include "xil_io.h"
#include "xparameters.h"

int main(){
	u32 bram1_read, addr_cmd;

	//BRAM0_READ_ADDR	5'b00000
	//BRAM1_READ_ADDR	5'b00000
	//BRAM1_Write_ADDR	5'b00011
	//DSP_INMODE		5'b00001
	//DSP_OPMODE		7'b0000101
	//DSP_ALUMODE		4'b0000
	//Execute			1'b0

	printf("\r\nHW 5-1 Program Start.\r\n");

    //A*B: alumode=0000 ; opmode:xxx0101 ; inmode=10001
	//bram1_write=00011 ;  bram1_read=00010 ; bram0_read=00000
	addr_cmd = 0b10000000010110001000110001000000;
	Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, addr_cmd);			//gpio0 input inst

	//bram1_write=00111 ;  bram1_read=00011 ; bram0_read=01011
    addr_cmd = 0b10000000010110001001110001101011;
    Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, addr_cmd);

    //A*B+C: alumode=0000 ; opmode:0110101 ; inmode=10001
	//bram1_write=01010 ;  bram1_read=00111 ; bram0_read=11111
    addr_cmd = 0b1000001101011000101010001111111;
    Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, addr_cmd);
	
    //C-A*B: alumode:0011 ; opmode:0110101 ; inmode=10001
	//bram1_write=01101 ;  bram1_read=00110 ; bram0_read=00001
    addr_cmd = 0b10011011010110001011010011000001;
    Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, addr_cmd);

    //A*B-C-1: alumode:0001 ; opmode:0110101 ; inmode=10001
	//bram1_write=01111 ;  bram1_read=11111 ; bram0_read=00000
    addr_cmd = 0b10001011010110001011111111100000;
    Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, addr_cmd);

	for(int i=0; i<32; i++){
		//Read data after DSP operation
		a_read = Xil_In32(XPAR_AXI_GPIO_1_BASEADDR + 4*i);	//gpio1 output data
		printf("BRAM1[%d] = %d", i, a_read);
	}

	for(int i=0; i<32; i++){
		//Write data in BRAM0
		Xil_Out32(XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR + 4*i, (i+1)^2);
	}

    //A*B: alumode=0000 ; opmode:0000101 ; inmode=10001
	//bram1_write=10000 ;  bram1_read=00010 ; bram0_read=00000
    addr_cmd = 0b10000000010110001100000001000000;
    Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, addr_cmd);

	//bram1_write=10001 ;  bram1_read=00011 ; bram0_read=01011
    addr_cmd = 0b10000000010110001100010001101011;
    Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, addr_cmd);

    //A*B+C: alumode=0000 ; opmode:0110101 ; inmode=10001
	//bram1_write=10010 ;  bram1_read=00111 ; bram0_read=11111
    addr_cmd = 0b10000011010110001100100011111111;
    Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, addr_cmd);
	
    //C-A*B: alumode:0011 ; opmode:0110101 ; inmode=10001
	//bram1_write=10011 ;  bram1_read=00110 ; bram0_read=00001
    addr_cmd = 0b10011011010110001100110011000001;
    Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, addr_cmd);

    //A*B-C-1: alumode:0001 ; opmode:0110101 ; inmode=10001
	//bram1_write=10100 ;  bram1_read=11111 ; bram0_read=00000
    addr_cmd = 0b10001011010110001101001111100000;
    Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, addr_cmd);

	for(int i=0; i<32; i++){
		//Read data after DSP operation
		a_read = Xil_In32(XPAR_AXI_GPIO_1_BASEADDR + 4*i);	//gpio1
		printf("BRAM1[%d] = %d", i, a_read);
	}
}