#include "mbed.h"
#include "rtos.h"
#include "lidarlitev2.h"
#include "Servo.h"
#include "const_def.h"

LidarLitev2 Lidar(P0_0, P0_1,false);

AnalogIn ana0(P0_23);

Servo servo0(P2_5);
Servo servo1(P2_4);
Servo servo2(P2_3);
Servo servo3(P2_2);
Servo servo4(P2_1);
Servo servo5(P2_0);

static int capteurs[NB_CAPTEURS];
static int actions[NB_ACTIONNEURS];

Mutex mutex_capteur[NB_CAPTEURS];
Mutex mutex_actionneur[NB_ACTIONNEURS];

Serial uart(USBTX,USBRX);

void init_com()
{
  uart.putc(NB_CAPTEURS);
  uart.putc(NB_ACTIONNEURS);
    // capteurs
  int i;
  for(i=0;i<NB_CAPTEURS;i++)
  {
    uart.putc(i);
    capteurs[i] = 0;
    if(i<NB_ANALOG)
      uart.putc(TYPE_ANALOG);
    else
      uart.putc(TYPE_LIDAR);
  }  
    //actionneurs
  for(i=0;i<NB_ACTIONNEURS;i++)
  {
    uart.putc(i);
    actions[i] = 255;
    if(i<NB_SERVOS)
      uart.putc(TYPE_SERVO);
    else
      uart.putc(TYPE_ROUE);
  }
}

void aquisitionAnalog0(void const *args)
{
  while(1)
  {
    mutex_capteur[0].lock();
      capteurs[0] = (int)(ana0.read() * 255);
    mutex_capteur[0].unlock();
    Thread::wait(DELAY_THREAD);
  }
}

void aquisitionLidar0(void const *args)
{
  Lidar.configure();
  while(1)
  {
    mutex_capteur[1].lock();
      capteurs[1] = Lidar.distance();
    mutex_capteur[1].unlock();
      Thread::wait(DELAY_THREAD);
  }
}

void actionServo0(void const *args)
{
  while(1)
  {
    mutex_actionneur[0].lock();
    servo0.position(actions[0]);
    mutex_actionneur[0].unlock();
    Thread::wait(DELAY_THREAD);
  }
}

void actionServo1(void const *args)
{
  while(1)
  {
    mutex_actionneur[1].lock();
    servo1.position(actions[1]);
    mutex_actionneur[1].unlock();
    Thread::wait(DELAY_THREAD);
  }
}

void actionServo2(void const *args)
{
  while(1)
  {
    mutex_actionneur[2].lock();
    servo2.position(actions[2]);
    mutex_actionneur[2].unlock();
    Thread::wait(DELAY_THREAD);
  }
}


void actionServo3(void const *args)
{
  while(1)
  {
    mutex_actionneur[3].lock();
    servo3.position(actions[3]);
    mutex_actionneur[3].unlock();
    Thread::wait(DELAY_THREAD);
  }
}
void actionServo4(void const *args)
{
  while(1)
  {
    mutex_actionneur[4].lock();
    servo4.position(actions[4]);
    mutex_actionneur[4].unlock();
    Thread::wait(DELAY_THREAD);
  }
}
void actionServo5(void const *args)
{
  while(1)
  {
    mutex_actionneur[5].lock();
    servo5.position(actions[5]);
    mutex_actionneur[5].unlock();
    Thread::wait(DELAY_THREAD);
  }
}


void actionPwm0(void const *args)
{
  while(1)
  {
    mutex_actionneur[6].lock();
    mutex_actionneur[6].unlock();
    Thread::wait(DELAY_THREAD);
  }
}

void actionPwm1(void const *args)
{
  while(1)
  {
    mutex_actionneur[7].lock();
    mutex_actionneur[7].unlock();
    Thread::wait(DELAY_THREAD);
  }
}

void receveur0(void const *args)
{
  while(1)
  {
   int id = uart.getc();
   int val = uart.getc();
   mutex_actionneur[id].lock();
    actions[id] = val;
   mutex_actionneur[id].unlock();
   Thread::wait(DELAY_THREAD);
  }
}

void sender0(void const *args)
{
  int i,value;
  int a[2];
  while(1)
  {
    for(i=0;i<NB_CAPTEURS;i++)
    {
      mutex_capteur[i].lock();
	value = capteurs[i];
      mutex_capteur[i].unlock();
      uart.putc(i);
      a[0] = (value >> 8);
      a[1] = ((value << 24) >> 24);
      uart.putc(a[0]);
      uart.putc(a[1]);
      Thread::wait(5);
    }
  }
}

int main()
{   
    bool reveil = 0;
    uart.baud(115200);
    while(!reveil)
    {
      char a = uart.getc();
      if(a==255)
	reveil = 1;
    }
    init_com();
    Thread analog_thread(aquisitionAnalog0);
    Thread lidar_thread(aquisitionLidar0);
    Thread sender_thread(sender0);
    
    Thread servo_thread0(actionServo0);
    Thread servo_thread1(actionServo1);
    Thread servo_thread2(actionServo2);
    Thread servo_thread3(actionServo3);
    Thread servo_thread4(actionServo4);
    Thread servo_thread5(actionServo5);
   // Thread pwm_thread0(actionPwm0);
   // Thread pwm_thread1(actionPwm1);
    Thread receveur_thread(receveur0);
    while(1)
    {
    }
    return 0;
}