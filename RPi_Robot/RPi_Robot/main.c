#include <m8c.h>        // Part specific constants and macros
#include "PSoCAPI.h"    // PSoC API definitions for all User Modules
#include "delay.h"
#include"stdio.h"
#include"string.h"
#include"stdlib.h"
	
#define STOP 0x00
#define FRONT 0x01
#define BACK 0x02
#define LEFT 0x03
#define RIGHT 0x04
#define Ctrl_Cmd 0x01
#define LEFT_SIDE 0x03
#define RIGHT_SIDE 0x02
#define INVALID_DISTANCE 0xff
#define CHANGE_ANGLE 0x01
#define AUTO_MODE 0x05
	
const int RangeTable[]={
	3618,
	3271,
	2867,
	2492,
	2210,
	1987,
	1795,
	1639,
	1506,
	1394,
	1287,
	1204,
	1124,
	1061,
	1002
};

int lRangeTable = sizeof(RangeTable)/sizeof(RangeTable[0]);
struct I2C_Regs {   
   
	
	BYTE bDirection;
    BYTE bSpeed ;
	//BYTE bLeftDistance;
	//BYTE bRightDistance;
	
	
	
 } Robot_Paras;

int i;

void Motor_Control(BYTE Motor_Mode);
BYTE Measure_Distance(BYTE bSide);
BYTE Lookup_Distance( WORD wADC_Count );
void Intialize(void);
void Turn_RangeSensor(int iAngle);
void Obstacle_Detection(BYTE y1,BYTE y2);
void main(void)
{
  Intialize();
  while(1)
  {
	Motor_Control(Robot_Paras.bDirection);	
  }
	
}

void Intialize(void)
{

   I2Cs_SetRamBuffer(sizeof(Robot_Paras), 2, (BYTE *)&Robot_Paras); 
   M8C_EnableGInt ; 
   I2Cs_Start();
   Range_PGA_Start(Range_PGA_HIGHPOWER);
   Range_ADC_Start(Range_ADC_HIGHPOWER); 
   AMUX4_Start();
   Robot_Paras.bSpeed=100; ;
   //Servo_PWM_Start();
}

void Motor_Control(BYTE Motor_Mode)
{
	switch(Motor_Mode)
		{

			case STOP:
			{
				BackLeftMotor_P_Stop();
   				BackRightMotor_P_Stop();
   				BackLeftMotor_N_Stop();
   				BackRightMotor_N_Stop();
				break;
			}
			case FRONT:
			{
				BackLeftMotor_P_WritePulseWidth(Robot_Paras.bSpeed);
				BackRightMotor_P_WritePulseWidth(Robot_Paras.bSpeed);
				BackLeftMotor_P_Start();
				BackLeftMotor_N_Stop();
   				BackRightMotor_P_Start();
   				BackRightMotor_N_Stop();
				break;
			}
			case BACK:
			{
				BackLeftMotor_N_WritePulseWidth(Robot_Paras.bSpeed);
				BackRightMotor_N_WritePulseWidth(Robot_Paras.bSpeed);
				BackLeftMotor_P_Stop();
				BackLeftMotor_N_Start();
   				BackRightMotor_P_Stop();
   				BackRightMotor_N_Start();
				break;
			}
			case LEFT:
			{
				BackRightMotor_P_WritePulseWidth(Robot_Paras.bSpeed);
				BackRightMotor_N_Stop();
				BackRightMotor_P_Start();
				BackLeftMotor_P_Stop();
				BackLeftMotor_N_WritePulseWidth(Robot_Paras.bSpeed);
				BackLeftMotor_N_Start();
				break;
			}
			case RIGHT:
			{
				BackLeftMotor_P_WritePulseWidth(Robot_Paras.bSpeed);		
				BackLeftMotor_P_Start();
				BackLeftMotor_N_Stop();
   				BackRightMotor_P_Stop();   				
   				BackRightMotor_N_WritePulseWidth(Robot_Paras.bSpeed);
				BackRightMotor_N_Start();
				break;
			}
			case AUTO_MODE:
			{
				Obstacle_Detection(Measure_Distance(LEFT_SIDE),Measure_Distance(RIGHT_SIDE));
				break;
			}
			default:
			{
				break;
			}
		
		}
}

BYTE Measure_Distance(BYTE bSide)
{	
	BYTE Distance;
	AMUX4_InputSelect(bSide);      
	Range_ADC_GetSamples(1);
	while(Range_ADC_fIsDataAvailable() == 0);   
	Distance= Lookup_Distance(Range_ADC_wClearFlagGetData()); 
	return(Distance);
	
}

BYTE Lookup_Distance( WORD wADC_Count ) 
{
	int i;
	float Distance;
	
	if( wADC_Count > RangeTable[0]||wADC_Count < RangeTable[lRangeTable-1] ) 
	{
		/* overflow/Under Flow */
		return INVALID_DISTANCE;
	} 
	
	for( i=0; i<lRangeTable-2; i++ )
	{
		if( wADC_Count >= RangeTable[i+1] )
			break;
	}
	/* Interpolate between i and i+1 */
	Distance=((i+4)*5)+(((int)wADC_Count-RangeTable[i])*5/(RangeTable[i+1]-RangeTable[i]));
	return((BYTE)Distance);
}

void Obstacle_Detection(BYTE y1,BYTE y2)
{
	if(y1==255 && y2==255)
	{
		Motor_Control(FRONT);
	}
			
	if((y1>0 && y1 <= 60)  || (y2>0 && y2 <= 60))
	{
		if(y1>y2)
		{
			Motor_Control(RIGHT);
			Delay10msTimes(80);
		}
		else if(y2 > y1)
		{
			Motor_Control(LEFT);
			Delay10msTimes(80);
		}
		else if(y1==y2)
		{

			Motor_Control(LEFT);
			Delay10msTimes(100);
		}
	}
				
	Motor_Control(FRONT);	
	Delay10msTimes(50);
			
}

void Turn_RangeSensor(int iAngle)
{
	Servo_PWM_WritePulseWidth(iAngle);
}