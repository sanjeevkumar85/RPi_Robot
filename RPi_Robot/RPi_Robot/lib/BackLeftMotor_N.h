//*****************************************************************************
//*****************************************************************************
//  FILENAME: BackLeftMotor_N.h
//   Version: 2.60, Updated on 2013/5/19 at 10:44:7
//  Generated by PSoC Designer 5.4.2946
//
//  DESCRIPTION: PWM8 User Module C Language interface file
//-----------------------------------------------------------------------------
//  Copyright (c) Cypress Semiconductor 2013. All Rights Reserved.
//*****************************************************************************
//*****************************************************************************
#ifndef BackLeftMotor_N_INCLUDE
#define BackLeftMotor_N_INCLUDE

#include <m8c.h>

#pragma fastcall16 BackLeftMotor_N_EnableInt
#pragma fastcall16 BackLeftMotor_N_DisableInt
#pragma fastcall16 BackLeftMotor_N_Start
#pragma fastcall16 BackLeftMotor_N_Stop
#pragma fastcall16 BackLeftMotor_N_bReadCounter              // Read  DR0
#pragma fastcall16 BackLeftMotor_N_WritePeriod               // Write DR1
#pragma fastcall16 BackLeftMotor_N_bReadPulseWidth           // Read  DR2
#pragma fastcall16 BackLeftMotor_N_WritePulseWidth           // Write DR2

// The following symbols are deprecated.
// They may be omitted in future releases
//
#pragma fastcall16 bBackLeftMotor_N_ReadCounter              // Read  DR0 (Deprecated)
#pragma fastcall16 bBackLeftMotor_N_ReadPulseWidth           // Read  DR2 (Deprecated)


//-------------------------------------------------
// Prototypes of the BackLeftMotor_N API.
//-------------------------------------------------

extern void BackLeftMotor_N_EnableInt(void);                        // Proxy Class 1
extern void BackLeftMotor_N_DisableInt(void);                       // Proxy Class 1
extern void BackLeftMotor_N_Start(void);                            // Proxy Class 1
extern void BackLeftMotor_N_Stop(void);                             // Proxy Class 1
extern BYTE BackLeftMotor_N_bReadCounter(void);                     // Proxy Class 2
extern void BackLeftMotor_N_WritePeriod(BYTE bPeriod);              // Proxy Class 1
extern BYTE BackLeftMotor_N_bReadPulseWidth(void);                  // Proxy Class 1
extern void BackLeftMotor_N_WritePulseWidth(BYTE bPulseWidth);      // Proxy Class 1

// The following functions are deprecated.
// They may be omitted in future releases
//
extern BYTE bBackLeftMotor_N_ReadCounter(void);            // Deprecated
extern BYTE bBackLeftMotor_N_ReadPulseWidth(void);         // Deprecated


//--------------------------------------------------
// Constants for BackLeftMotor_N API's.
//--------------------------------------------------

#define BackLeftMotor_N_CONTROL_REG_START_BIT  ( 0x01 )
#define BackLeftMotor_N_INT_REG_ADDR           ( 0x0e1 )
#define BackLeftMotor_N_INT_MASK               ( 0x02 )


//--------------------------------------------------
// Constants for BackLeftMotor_N user defined values
//--------------------------------------------------

#define BackLeftMotor_N_PERIOD                 ( 0x64 )
#define BackLeftMotor_N_PULSE_WIDTH            ( 0x32 )


//-------------------------------------------------
// Register Addresses for BackLeftMotor_N
//-------------------------------------------------

#pragma ioport  BackLeftMotor_N_COUNTER_REG:    0x024      //DR0 Count register
BYTE            BackLeftMotor_N_COUNTER_REG;
#pragma ioport  BackLeftMotor_N_PERIOD_REG: 0x025          //DR1 Period register
BYTE            BackLeftMotor_N_PERIOD_REG;
#pragma ioport  BackLeftMotor_N_COMPARE_REG:    0x026      //DR2 Compare register
BYTE            BackLeftMotor_N_COMPARE_REG;
#pragma ioport  BackLeftMotor_N_CONTROL_REG:    0x027      //Control register
BYTE            BackLeftMotor_N_CONTROL_REG;
#pragma ioport  BackLeftMotor_N_FUNC_REG:   0x124          //Function register
BYTE            BackLeftMotor_N_FUNC_REG;
#pragma ioport  BackLeftMotor_N_INPUT_REG:  0x125          //Input register
BYTE            BackLeftMotor_N_INPUT_REG;
#pragma ioport  BackLeftMotor_N_OUTPUT_REG: 0x126          //Output register
BYTE            BackLeftMotor_N_OUTPUT_REG;
#pragma ioport  BackLeftMotor_N_INT_REG:       0x0e1       //Interrupt Mask Register
BYTE            BackLeftMotor_N_INT_REG;


//-------------------------------------------------
// BackLeftMotor_N Macro 'Functions'
//-------------------------------------------------

#define BackLeftMotor_N_Start_M \
   BackLeftMotor_N_CONTROL_REG |=  BackLeftMotor_N_CONTROL_REG_START_BIT

#define BackLeftMotor_N_Stop_M  \
   BackLeftMotor_N_CONTROL_REG &= ~BackLeftMotor_N_CONTROL_REG_START_BIT

#define BackLeftMotor_N_EnableInt_M   \
   M8C_EnableIntMask(BackLeftMotor_N_INT_REG, BackLeftMotor_N_INT_MASK)

#define BackLeftMotor_N_DisableInt_M  \
   M8C_DisableIntMask(BackLeftMotor_N_INT_REG, BackLeftMotor_N_INT_MASK)

#endif
// end of file BackLeftMotor_N.h
