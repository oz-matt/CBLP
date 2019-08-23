#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include "hwlib.h"
#include "socal/socal.h"
#include "socal/hps.h"
#include "socal/alt_gpio.h"
#include "hps_0.h"

#define HW_REGS_BASE ( ALT_LWFPGASLVS_OFST )
#define HW_REGS_SPAN ( 0x00200000 )
#define HW_REGS_MASK ( HW_REGS_SPAN - 1 )

int main() {
printf("1\n");
	void *virtual_base;
	int fd;
	int loop_count = 0;
	int counter = 0;
	int led_mask;
	void *leds_addr;
	printf("2\n");
	printf("ALT_STM_OFST val: 0x%08x\n", ALT_STM_OFST);

	printf("ALT_LWFPGASLVS_OFST val: 0x%08x\n", ALT_LWFPGASLVS_OFST);

	// map the address space for the LED registers into user space so we can interact with them.
	// we'll actually map in the entire CSR span of the HPS since we want to access various registers within that span

	if( ( fd = open( "/dev/mem", ( O_RDWR | O_SYNC ) ) ) == -1 ) {
		printf( "ERROR: could not open \"/dev/mem\"...\n" );
		return( -1 );
	}
	
	printf("3\n");

	virtual_base = mmap( NULL, HW_REGS_SPAN, ( PROT_READ | PROT_WRITE ), MAP_SHARED, fd, HW_REGS_BASE );

	if( virtual_base == MAP_FAILED ) {
		printf( "ERROR: mmap() failed...\n" );
		close( fd );
		return( -1 );
	}
	
	printf("4\n");
	
	leds_addr=virtual_base + CUSTOM_LEDS_0_BASE;
	

	// toggle the LEDs a bit

	while( loop_count < 60 ) {
	
	printf("5\n");
		
		// control led
		*(uint32_t *)leds_addr = counter; 
		
		printf("6\n");

		// wait 100ms
		usleep( 1000*1000 );
		
		if(counter++ >= 255)
			counter = 0;
			
		printf("Counter: %i\n", counter);
			
		++loop_count;
		
	} // while
	

	// clean up our memory mapping and exit
	
	if( munmap( virtual_base, HW_REGS_SPAN ) != 0 ) {
		printf( "ERROR: munmap() failed...\n" );
		close( fd );
		return( -1 );
	}

	close( fd );

	return( 0 );
}
