#ifndef LidarLitev2_H
#define LidarLitev2_H
 
 
#include "mbed.h"
 
/** My LidarLite class
*   Used for controlling and interacting with the LidarLitev2
Example:
*   @code
*   //Measures distance from the lidarlite and prints it through serial
*   #include "LidarLitev2.h"
*   LidarLitev2 Lidar(p28, p27);
*   Serial pc(USBTX,USBRX);
*
*
*       Timer dt;
*   int main()
*   {   
*    
*       pc.baud(115200);
*       Lidar.configure();
*       dt.start();
*       while(1){
*           pc.printf("distance = %d cm frequency = %.2f Hz\n", Lidar.distance(), 1/dt.read());
*           dt.reset();
*       }
*   }
*   @endcode
*
*
*/
 
class LidarLitev2
{
public:
    LidarLitev2(PinName sda, PinName scl, bool = true);  // Constructor iniates I2C setup
    
    /** Configure the different modes of the Lidar */
    void configure(int = 0, int = 0xc4);   // Configure the mode and slave address
    
    /** Sets the Lidar to read continuously, indicating its ready to be read from by the modepin pulling down,  a cerntain amount of times */
    void beginContinuous(bool = true, char = 0x04, char = 0xff, int = 0xc4); //Enable if using continous setup with mode from Lidar and pulldown
    
    /** Calclulates distance through I2C protocol of activating sensor with a write, then a write for the register, and a read. */
    int distance(bool = true, bool = true, int = 0xc4); 
    // Returns distance as a integer in cm
 
    /** 1.) Set Lidar circuit for continuous mode
    *2.) utilize the beginContinous function and configure as desired
    * This function returns distance without any need to activate the lidar senore through a write command,
    * instead the mode pin pulls down when the lidar is ready for a read
    * Returns distance as a integer in cm */
    int distanceContinuous(int = 0xc4); 
 
 
private:
    // I2C Functions //
    ///////////////////
    I2C i2c; // Kept private as to prevent changing the I2C once set in the constructor of LidarLitev2
};
 
#endif /* LidarLitev2_H */