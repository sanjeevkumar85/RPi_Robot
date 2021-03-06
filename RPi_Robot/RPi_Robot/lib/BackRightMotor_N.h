//*****************************************************************************
//*****************************************************************************
//  FILENAME: BackRightMotor_N.h
//   Version: 2.60, Updated on 2013/5/19 at 10:44:7
//  Generated by PSoC Designer 5.4.2946
//
//  DESCRIPTION: PWM8 User Module C Language interface file
//-----------------------------------------------------------------------------
//  Copyright (c) Cypress Semiconductor 2013. All Rights Reserved.
//*****************************************************************************
//*****************************************************************************
#ifndef BackRightMotor_N_INCLUDE
#define BackRightMotor_N_INCLUDE

#include <m8c.h>

#pragma fastcall16 BackRightMotor_N_EnableInt
#pragma fastcall16 BackRightMotor_N_DisableInt
#pragma fastcall16 BackRightMotor_N_Start
#pragma fastcall16 BackRightMotor_N_Stop
#pragma fastcall16 BackRightMotor_N_bReadCounter              // Read  DR0
#pragma fastcall16 BackRightMotor_N_WritePeriod               // Write DR1
#pragma fastcall16 BackRightMotor_N_bReadPulseWidth           // Read  DR2
#pragma fastcall16 BackRightMotor_N_WritePulseWidth           // Write DR2

// The following symbols are deprecated.
// They may be omitted in future releases
//
#pragma fastcall16 bBackRightMotor_N_ReadCounter              // Read  DR0 (Deprecated)
#pragma fastcall16 bBackRightMotor_N_ReadPulseWidth           // Read  DR2 (Deprecated)


//-------------------------------------------------
// Prototypes of the BackRightMotor_N API.
//-------------------------------------------------

extern void BackRightMotor_N_EnableInt(void);                        // Proxy Class 1
extern void BackRightMotor_N_DisableInt(void);                       // Proxy Class 1
extern void BackRightMotor_N_Start(void);                            // Proxy Class 1
extern void BackRightMotor_N_Stop(void);                             // Proxy Class 1
extern BYTE BackRightMotor_N_bReadCounter(void);                     // Proxy Class 2
extern void BackRightMotor_N_WritePeriod(BYTE bPeriod);              // Proxy Class 1
extern BYTE BackRightMotor_N_bReadPulseWidth(void);                  // Proxy Class 1
extern void BackRightMotor_N_WritePulseWidth(BYTE bPulseWidth);      // Proxy Class 1

// The following functions are deprecated.
// They may be omitted in future releases
//
extern BYTE bBackRightMotor_N_ReadCounter(void);            // Deprecated
extern BYTE bBackRightMotor_N_ReadPulseWidth(void);         // Deprecated


//--------------------------------------------------
// Constants for BackRightMotor_N API's.
//--------------------------------------------------

#define BackRightMotor_N_CONTROL_REG_START_BIT ( 0x01 )
#define BackRightMotor_N_INT_REG_ADDR          ( 0x0e1 )
#define BackRightMotor_N_INT_MASK              ( 0x20 )


//--------------------------------------------------
// Constants for BackRightMotor_N user defined values
//--------------------------------------------------

#define BackRightMotor_N_PERIOD                ( 0x64 )
#define BackRightMotor_N_PULSE_WIDTH           ( 0x32 )


//-------------------------------------------------
// Register Addresses for BackRightMotor_N
//-------------------------------------------------

#pragma ioport  BackRightMotor_N_COUNTER_REG:   0x034      //DR0 Count register
BYTE            BackRightMotor_N_COUNTER_REG;
#pragma ioport  BackRightMotor_N_PERIOD_REG:    0x035      //DR1 Period register
BYTE            BackRightMotor_N_PERIOD_REG;
#pragma ioport  BackRightMotor_N_COMPARE_REG:   0x036      //DR2 Compare register
BYTE            BackRightMotor_N_COMPARE_REG;
#pragma ioport  BackRightMotor_N_CONTROL_REG:   0x037      //Control register
BYTE            BackRightMotor_N_CONTROL_REG;
#pragma ioport  BackRightMotor_N_FUNC_REG:  0x134          //Function register
BYTE            BackRightMotor_N_FUNC_REG;
#pragma ioport  BackRightMotor_N_INPUT_REG: 0x135          //Input register
BYTE            BackRightMotor_N_INPUT_REG;
#pragma ioport  BackRightMotor_N_OUTPUT_REG:    0x136      //Output register
BYTE            BackRightMotor_N_OUTPUT_REG;
#pragma ioport  BackRightMotor_N_INT_REG:       0x0e1      //Interrupt Mask Register
BYTE            BackRightMotor_N_INT_REG;


//-------------------------------------------------
// BackRightMotor_N Macro 'Functions'
//-------------------------------------------------

#define BackRightMotor_N_Start_M \
   BackRightMotor_N_CONTROL_REG |=  BackRightMotor_N_CONTROL_REG_START_BIT

#define BackRightMotor_N_Stop_M  \
   BackRightMotor_N_CONTROL_REG &= ~BackRightMotor_N_CONTROL_REG_START_BIT

#define BackRightMotor_N_EnableInt_M   \
   M8C_EnableIntMask(BackRightMotor_N_INT_REG, BackRightMotor_N_INT_MASK)

#define BackRightMotor_N_DisableInt_M  \
   M8C_DisableIntMask(BackRightMotor_N_INT_REG, BackRightMotor_N_INT_MASK)

#endif
// end of file BackRightMotor_N.h
