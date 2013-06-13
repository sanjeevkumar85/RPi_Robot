//*****************************************************************************
//*****************************************************************************
//  FILENAME:  Range_PGA.h  ( PGA )
//  Version: 3.2, Updated on 2013/5/19 at 10:43:59
//  Generated by PSoC Designer 5.4.2946
//
//  DESCRIPTION:  PGA User Module C Language interface file.
//-----------------------------------------------------------------------------
//      Copyright (c) Cypress Semiconductor 2013. All Rights Reserved.
//*****************************************************************************
//*****************************************************************************
#ifndef Range_PGA_INCLUDE
#define Range_PGA_INCLUDE

#include <M8C.h>

//-------------------------------------------------
// Constants for Range_PGA API's.
//-------------------------------------------------
#define Range_PGA_OFF         0
#define Range_PGA_LOWPOWER    1
#define Range_PGA_MEDPOWER    2
#define Range_PGA_HIGHPOWER   3

#define Range_PGA_G48_0    0x0C
#define Range_PGA_G24_0    0x1C

#define Range_PGA_G16_0    0x08
#define Range_PGA_G8_00    0x18
#define Range_PGA_G5_33    0x28
#define Range_PGA_G4_00    0x38
#define Range_PGA_G3_20    0x48
#define Range_PGA_G2_67    0x58
#define Range_PGA_G2_27    0x68
#define Range_PGA_G2_00    0x78
#define Range_PGA_G1_78    0x88
#define Range_PGA_G1_60    0x98
#define Range_PGA_G1_46    0xA8
#define Range_PGA_G1_33    0xB8
#define Range_PGA_G1_23    0xC8
#define Range_PGA_G1_14    0xD8
#define Range_PGA_G1_06    0xE8
#define Range_PGA_G1_00    0xF8
#define Range_PGA_G0_93    0xE0
#define Range_PGA_G0_87    0xD0
#define Range_PGA_G0_81    0xC0
#define Range_PGA_G0_75    0xB0
#define Range_PGA_G0_68    0xA0
#define Range_PGA_G0_62    0x90
#define Range_PGA_G0_56    0x80
#define Range_PGA_G0_50    0x70
#define Range_PGA_G0_43    0x60
#define Range_PGA_G0_37    0x50
#define Range_PGA_G0_31    0x40
#define Range_PGA_G0_25    0x30
#define Range_PGA_G0_18    0x20
#define Range_PGA_G0_12    0x10
#define Range_PGA_G0_06    0x00

#define Range_PGA_AGNDBUFAPI 0

#pragma fastcall16 Range_PGA_Start
#pragma fastcall16 Range_PGA_SetPower
#pragma fastcall16 Range_PGA_SetGain
#pragma fastcall16 Range_PGA_Stop

#if (Range_PGA_AGNDBUFAPI)
#pragma fastcall16 Range_PGA_EnableAGNDBuffer
#pragma fastcall16 Range_PGA_DisableAGNDBuffer
#endif

//-------------------------------------------------
// Prototypes of the Range_PGA API.
//-------------------------------------------------
extern void Range_PGA_Start(BYTE bPowerSetting);     // Proxy class 2
extern void Range_PGA_SetPower(BYTE bPowerSetting);  // Proxy class 2
extern void Range_PGA_SetGain(BYTE bGainSetting);    // Proxy class 2
extern void Range_PGA_Stop(void);                    // Proxy class 1

#if (Range_PGA_AGNDBUFAPI)
extern void Range_PGA_EnableAGNDBuffer(void);
extern void Range_PGA_DisableAGNDBuffer(void);
#endif

//-------------------------------------------------
// Register Addresses for Range_PGA
//-------------------------------------------------

#pragma ioport  Range_PGA_GAIN_CR0: 0x075
BYTE            Range_PGA_GAIN_CR0;
#pragma ioport  Range_PGA_GAIN_CR1: 0x076
BYTE            Range_PGA_GAIN_CR1;
#pragma ioport  Range_PGA_GAIN_CR2: 0x077
BYTE            Range_PGA_GAIN_CR2;
#pragma ioport  Range_PGA_GAIN_CR3: 0x074
BYTE            Range_PGA_GAIN_CR3;

#endif
// end of file Range_PGA.h
