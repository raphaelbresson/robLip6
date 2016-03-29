#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <termios.h>

int main()
{
  int uart = open("/dev/ttyACM0", O_RDWR | O_NOCTTY | O_NDELAY);
  if(uart == -1)
  {
    fprintf(stderr,"Erreur lors de l'ouverture de la connection UART\n");
    return -1;
  }
  unsigned int c = 0xFF;
  struct termios options;
  tcgetattr(uart,&options);
  options.c_cflag = B115200 | CS8 | CLOCAL | CREAD;
  options.c_iflag = IGNPAR;
  options.c_oflag = 0;
  options.c_lflag = 0;
  tcflush(uart, TCIFLUSH);
  tcsetattr(uart, TCSANOW, &options);
  unsigned char buffer[3];
  int tailleRecv = 0,i;
  write(uart,&c,1);
  while(1)
  {
    tailleRecv = read(uart, (void*) buffer, 3);
    if(tailleRecv > 0)
    {
	printf("analog: %d\n", (unsigned int)buffer[2]);
	printf("i2c: %d,%d\n", buffer[1], buffer[0]);
    }
  }	
  close(uart);
  return 0;
}