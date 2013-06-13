//*****************************************************************************
//*****************************************************************************
//  FILENAME: I2Cs.h
//  Version: 2.00, Updated on 2013/5/19 at 10:43:36
//  Generated by PSoC Designer 5.4.2946
//
//  DESCRIPTION: I2Cs User Module C Language interface file
//-----------------------------------------------------------------------------
//  Copyright (c) Cypress Semiconductor 2013. All Rights Reserved.
//*****************************************************************************
//*****************************************************************************
#ifndef I2Cs_INCLUDE
#define I2Cs_INCLUDE

#include <m8c.h>

#define I2Cs_SLAVE_ADDR                  0x52
#define I2Cs_DYNAMIC_ADDR                0
#define I2Cs_ROM_ENABLE                  0
#define I2Cs_AUTO_ADDR_CHECK              0                          //CY8C28X45 may have this 0 or 1 while all other have 0
#define I2Cs_ADDR_REG_PRESENT             0                          //CY8C28X45 have 1 always while all other have 0
#define I2Cs_CY8C22x45                    0                          // 1 if it is CY8C22x45 device, otherwice 0

/* Create pragmas to support proper argument and return value passing */
#pragma fastcall16  I2Cs_Start
#pragma fastcall16  I2Cs_DisableInt
#pragma fastcall16  I2Cs_EnableInt
#pragma fastcall16  I2Cs_ResumeInt
#pragma fastcall16  I2Cs_Stop
#pragma fastcall16  I2Cs_DisableSlave
#pragma fastcall16  I2Cs_SetRamBuffer
#pragma fastcall16  I2Cs_GetAddr
#pragma fastcall16  I2Cs_GetActivity

#if (I2Cs_DYNAMIC_ADDR | I2Cs_AUTO_ADDR_CHECK)
#pragma fastcall16  I2Cs_SetAddr
#endif

#if ( I2Cs_ROM_ENABLE )
#pragma fastcall16  I2Cs_SetRomBuffer
#endif

#if (I2Cs_CY8C22x45)
#pragma fastcall16  I2Cs_EnableHWAddrCheck
#pragma fastcall16  I2Cs_DisableHWAddrCheck
#endif

//-------------------------------------------------
// Constants for I2Cs_bBusy_Flag
//-------------------------------------------------
//
//
#define I2Cs_I2C_FREE                  0x00    // No transaction at the current moment
#define I2Cs_I2C_BUSY_RAM_READ         0x01    // RAM read transaction in progress
#define I2Cs_I2C_BUSY_RAM_WRITE        0x02    // RAM write transaction in progress
#define I2Cs_I2C_BUSY_ROM_READ         0x04    // ROM read transaction in progress
#define I2Cs_I2C_BUSY_ROM_WRITE        0x08    // ROM write transaction in progress

//-------------------------------------------------
// Constants for I2Cs API's.
//-------------------------------------------------
//
//
#define I2Cs_ACTIVITY_MASK   0xB0
#define I2Cs_ANY_ACTIVITY    0x80
#define I2Cs_READ_ACTIVITY   0x20
#define I2Cs_WRITE_ACTIVITY  0x10

//-------------------------------------------------
// Prototypes of the I2Cs API.
//-------------------------------------------------
extern void  I2Cs_Start(void);                                         // Proxy Class 1, if Static Address
                                                                                   // Proxy Class 4, if Dynamic Address
extern void  I2Cs_DisableInt(void);                                    // Proxy Class 1
extern void  I2Cs_EnableInt(void);                                     // Proxy Class 1
extern void  I2Cs_ResumeInt(void);                                     // Proxy Class 1
extern void  I2Cs_Stop(void);                                          // Proxy Class 1
extern void  I2Cs_DisableSlave(void);                                  // Proxy Class 1
extern void  I2Cs_SetRamBuffer(BYTE bSize, BYTE bRWBoundary, BYTE * pAddr); // Proxy Class 4 
extern BYTE  I2Cs_GetAddr(void);                                       // Proxy Class 4
extern BYTE  I2Cs_GetActivity(void);                                   // Proxy Class 4

#if (I2Cs_DYNAMIC_ADDR | I2Cs_AUTO_ADDR_CHECK)
extern void  I2Cs_SetAddr(BYTE bAddr);                                 // Proxy Class 4
#endif

#if ( I2Cs_ROM_ENABLE )
extern void  I2Cs_SetRomBuffer(BYTE bSize, const BYTE * pAddr);        // Proxy Class 4
#endif

#if ( I2Cs_CY8C22x45 ) 
extern void  I2Cs_EnableHWAddrCheck(void);
extern void  I2Cs_DisableHWAddrCheck(void);
#endif

//-------------------------------------------------
// Define global variables.                 
//-------------------------------------------------
#if ( I2Cs_DYNAMIC_ADDR )
#if ( I2Cs_AUTO_ADDR_CHECK^1 )
extern   BYTE   I2Cs_bAddr;                                            // Proxy Class 1
#endif
#endif

extern   BYTE   I2Cs_bBusy_Flag;

#endif
