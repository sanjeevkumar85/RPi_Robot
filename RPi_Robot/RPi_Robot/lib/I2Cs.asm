;;*****************************************************************************
;;*****************************************************************************
;;  FILENAME: I2Cs.asm
;;  Version: 2.00, Updated on 2013/5/19 at 10:43:36
;;  Generated by PSoC Designer 5.4.2946
;;
;;  DESCRIPTION: EzI2Cs User Module software implementation file
;;
;;  NOTE: User Module APIs conform to the fastcall16 convention for marshalling
;;        arguments and observe the associated "Registers are volatile" policy.
;;        This means it is the caller's responsibility to preserve any values
;;        in the X and A registers that are still needed after the API functions
;;        returns. For Large Memory Model devices it is also the caller's 
;;        responsibility to perserve any value in the CUR_PP, IDX_PP, MVR_PP and 
;;        MVW_PP registers. Even though some of these registers may not be modified
;;        now, there is no guarantee that will remain the case in future releases.
;;-----------------------------------------------------------------------------
;;  Copyright (c) Cypress Semiconductor 2013. All Rights Reserved.
;;*****************************************************************************
;;*****************************************************************************

include "m8c.inc"
include "memory.inc"
include "I2Cs.inc"
include "PSoCGPIOINT.inc"

;-----------------------------------------------
; include instance specific register definitions
;-----------------------------------------------

;-----------------------------------------------
;  Global Symbols
;-----------------------------------------------
;-------------------------------------------------------------------
;  Declare the functions global for both assembler and C compiler.
;
;  Note that there are two names for each API. First name is
;  assembler reference. Name with underscore is name refence for
;  C compiler.  Calling function in C source code does not require
;  the underscore.
;-------------------------------------------------------------------

export    I2Cs_EnableInt
export   _I2Cs_EnableInt
export    I2Cs_ResumeInt
export   _I2Cs_ResumeInt
export    I2Cs_Start
export   _I2Cs_Start

export    I2Cs_DisableInt
export   _I2Cs_DisableInt
export    I2Cs_Stop
export   _I2Cs_Stop
export    I2Cs_DisableSlave
export   _I2Cs_DisableSlave
export    I2Cs_SetRamBuffer
export   _I2Cs_SetRamBuffer
export    I2Cs_GetAddr
export   _I2Cs_GetAddr
export    I2Cs_GetActivity
export   _I2Cs_GetActivity


IF (I2Cs_DYNAMIC_ADDR | I2Cs_AUTO_ADDR_CHECK) ;; Enable this function if Address is Dynamic or the AUTO_ADDR_CHECK is enabled
export    I2Cs_SetAddr
export   _I2Cs_SetAddr
ENDIF

IF (I2Cs_ROM_ENABLE)  ;; Enable only if alternate ROM Address is Enabled
export    I2Cs_SetRomBuffer
export   _I2Cs_SetRomBuffer
ENDIF

IF (I2Cs_CY8C22x45)
export    I2Cs_EnableHWAddrCheck
export   _I2Cs_EnableHWAddrCheck
export    I2Cs_DisableHWAddrCheck
export   _I2Cs_DisableHWAddrCheck
ENDIF


AREA UserModules (ROM, REL, CON)

.SECTION

;-----------------------------------------------------------------------------
;  FUNCTION NAME: I2Cs_Start
;
;  DESCRIPTION:
;   Initialize the I2Cs I2C bus interface.
;
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:
;
;  RETURNS: none
;
;  SIDE EFFECTS:
;    REGISTERS ARE VOLATILE: THE A AND X REGISTERS MAY BE MODIFIED!
;    IN THE LARGE MEMORY MODEL CURRENTLY ONLY THE PAGE POINTER 
;    REGISTERS LISTED BELOW ARE MODIFIED.  THIS DOES NOT GUARANTEE 
;    THAT IN FUTURE IMPLEMENTATIONS OF THIS FUNCTION OTHER PAGE POINTER 
;    REGISTERS WILL NOT BE MODIFIED.
;          
;    Page Pointer Registers Modified: 
;          CUR_PP
;
;  THEORY of OPERATION or PROCEDURE:
;

 I2Cs_Start:
_I2Cs_Start:

   RAM_PROLOGUE RAM_USE_CLASS_4
   RAM_SETPAGE_CUR >I2Cs_varPage
   
IF (I2Cs_DYNAMIC_ADDR)  ;; DYNAMIC ADDRESS
IF (I2Cs_AUTO_ADDR_CHECK^1) ;; for CY8C28X45 chip: do not touch the I2Cs_bAddr variable if AutoAddressCompare feature is enabled.
   mov  [I2Cs_bAddr],I2Cs_SLAVE_ADDR
ENDIF   
ENDIF
IF (I2Cs_CY8C22x45)
   M8C_SetBank1
   mov   reg[I2Cs_ADDR_REG], (I2Cs_SLAVE_ADDR>>1)
   M8C_SetBank0
ENDIF

   M8C_SetBank1 ;The SDA and SCL pins are setting to Hi-z drive mode
   and reg[I2CsSDA_DriveMode_0_ADDR],~(I2CsSDA_MASK|I2CsSCL_MASK)
   or  reg[I2CsSDA_DriveMode_1_ADDR], (I2CsSDA_MASK|I2CsSCL_MASK)
   M8C_SetBank0
   or  reg[I2CsSDA_DriveMode_2_ADDR], (I2CsSDA_MASK|I2CsSCL_MASK)

   mov  [I2Cs_bState],0x00    ;; Make sure state machine is initialized
   mov [I2Cs_bBusy_Flag],I2Cs_I2C_FREE ;; Clear Busy flag

   call I2Cs_EnableInt
   call I2Cs_EnableSlave

   nop
   nop
   nop
   nop
   nop
   
   mov A, 0
   mov [I2Cs_bRAM_RWoffset], A
IF (I2Cs_ROM_ENABLE)
   mov [I2Cs_bROM_RWoffset], A
ENDIF
   
   M8C_SetBank1 ;The SDA and SCL pins are restored to Open Drain Low drive mode
   or reg[I2CsSDA_DriveMode_0_ADDR], (I2CsSDA_MASK|I2CsSCL_MASK)
   or reg[I2CsSDA_DriveMode_1_ADDR], (I2CsSDA_MASK|I2CsSCL_MASK)
   M8C_SetBank0
   or reg[I2CsSDA_DriveMode_2_ADDR], (I2CsSDA_MASK|I2CsSCL_MASK)

   RAM_EPILOGUE RAM_USE_CLASS_4
   ret

.ENDSECTION

IF (I2Cs_DYNAMIC_ADDR | I2Cs_AUTO_ADDR_CHECK) ;; Enable this function if Address is Dynamic or the AUTO_ADDR_CHECK is enabled
.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: I2Cs_SetAddr(BYTE bAddr)
;
;  DESCRIPTION:
;   Set the I2C slave address for the I2Cs I2C bus interface.
;
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:
;      A =>  Slave address
;
;  RETURNS: none
;
;  SIDE EFFECTS;    
;    REGISTERS ARE VOLATILE: THE A AND X REGISTERS MAY BE MODIFIED!
;    IN THE LARGE MEMORY MODEL CURRENTLY ONLY THE PAGE POINTER 
;    REGISTERS LISTED BELOW ARE MODIFIED.  THIS DOES NOT GUARANTEE 
;    THAT IN FUTURE IMPLEMENTATIONS OF THIS FUNCTION OTHER PAGE POINTER 
;    REGISTERS WILL NOT BE MODIFIED.
;          
;    Page Pointer Registers Modified: 
;          CUR_PP
;
;  THEORY of OPERATION or PROCEDURE:
;

 I2Cs_SetAddr:
_I2Cs_SetAddr:
   RAM_PROLOGUE RAM_USE_CLASS_4
IF (I2Cs_AUTO_ADDR_CHECK^1) ;; for CY8C28X45 chip: do not touch the I2Cs_bAddr variable if AutoAddressCompare feature is enabled.
   RAM_SETPAGE_CUR >I2Cs_bAddr
 IF (I2Cs_CY8C22x45)
   and   A, ~I2Cs_HW_ADDR_EN
   M8C_SetBank1
   mov   reg[I2Cs_ADDR_REG], A
   M8C_SetBank0
 ENDIF
   asl   A
   mov   [I2Cs_bAddr],A
ELSE                          ;; write to the ADDR register instead
   RAM_PROLOGUE RAM_USE_CLASS_2
   and  A, ~I2Cs_HW_ADDR_MASK	; verify address value
   mov  X, SP
   push A                                   ; store address value
   M8C_SetBank1               ;; Set Bank 1
   mov  A, reg[I2Cs_ADDR_REG]   ; get value from address register
   and  A, I2Cs_HW_ADDR_MASK    ; define highest bit
   or   A, [X]                              ; form address value 	
   mov  reg[I2Cs_ADDR_REG], A   ; set new address value to register
   M8C_SetBank0               ;; Set Bank 0
   pop  A
   RAM_EPILOGUE RAM_USE_CLASS_2
ENDIF
   RAM_EPILOGUE RAM_USE_CLASS_4
   ret

.ENDSECTION
ENDIF

.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME:BYTE I2Cs_GetActivity(void)
;
;  DESCRIPTION:
;    Return a non-zero value if the I2C hardware has seen activity on the bus.
;    The activity flag will be cleared if set when calling this function.
;
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:  none
;
;  RETURNS: 
;    BYTE  non-zero = Activity
;          zero     = No Activity
;
;  SIDE EFFECTS;    
;    REGISTERS ARE VOLATILE: THE A AND X REGISTERS MAY BE MODIFIED!
;    IN THE LARGE MEMORY MODEL CURRENTLY ONLY THE PAGE POINTER 
;    REGISTERS LISTED BELOW ARE MODIFIED.  THIS DOES NOT GUARANTEE 
;    THAT IN FUTURE IMPLEMENTATIONS OF THIS FUNCTION OTHER PAGE POINTER 
;    REGISTERS WILL NOT BE MODIFIED.
;          
;    Page Pointer Registers Modified: 
;          CUR_PP
;
;  THEORY of OPERATION or PROCEDURE:
;

 I2Cs_GetActivity:
_I2Cs_GetActivity:
   RAM_PROLOGUE RAM_USE_CLASS_4
   RAM_SETPAGE_CUR >I2Cs_bState
   mov   A,[I2Cs_bState]
   and   A,I2Cs_ACTIVITY_MASK         ; Mask off activity bits
   and   [I2Cs_bState],~I2Cs_ACTIVITY_MASK ; Clear system activity bits

I2Cs_GetActivity_End:
   RAM_EPILOGUE RAM_USE_CLASS_4
   ret

.ENDSECTION

.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: BYTE I2Cs_GetAddr(Void)
;
;  DESCRIPTION:
;   Get the I2C slave address for the I2Cs I2C bus interface.
;
;-----------------------------------------------------------------------------
;
;  ARGUMENTS: none
;
;  RETURNS: none
;
;  SIDE EFFECTS;    
;    REGISTERS ARE VOLATILE: THE A AND X REGISTERS MAY BE MODIFIED!
;    IN THE LARGE MEMORY MODEL CURRENTLY ONLY THE PAGE POINTER 
;    REGISTERS LISTED BELOW ARE MODIFIED.  THIS DOES NOT GUARANTEE 
;    THAT IN FUTURE IMPLEMENTATIONS OF THIS FUNCTION OTHER PAGE POINTER 
;    REGISTERS WILL NOT BE MODIFIED.
;          
;    Page Pointer Registers Modified: 
;          CUR_PP
;
;
;  THEORY of OPERATION or PROCEDURE:
;

 I2Cs_GetAddr:
_I2Cs_GetAddr:

IF (I2Cs_DYNAMIC_ADDR | I2Cs_AUTO_ADDR_CHECK) ;; if Address is Dynamic or the AUTO_ADDR_CHECK is enabled
   RAM_PROLOGUE RAM_USE_CLASS_4
IF (I2Cs_AUTO_ADDR_CHECK^1) ;; for CY8C28X45 chip: do not touch the I2Cs_bAddr variable if AutoAddressCompare feature is enabled.
   RAM_SETPAGE_CUR >I2Cs_bAddr
   mov   A,[I2Cs_bAddr]
   asr   A                          ; Shift Addr to right to drop RW bit.
ELSE                          ;; read the address from ADDR register instead
   M8C_SetBank1               ;; Set Bank 1 
   mov A, reg[I2Cs_ADDR_REG]
   M8C_SetBank0               ;; Set Bank 0
ENDIF
   and   A, 0x7f              ; Mask off bogus MSb
   RAM_EPILOGUE RAM_USE_CLASS_4
ELSE
   mov   A,0x52            
ENDIF
   ret

.ENDSECTION



.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: I2Cs_EnableInt
;  FUNCTION NAME: I2Cs_ResumeInt
;  DESCRIPTION:
;     Enables SDA interrupt allowing start condition detection. Remember to call the
;     global interrupt enable function by using the macro: M8C_EnableGInt.
;	  I2Cs_ResumeInt performs the enable int function without fist clearing
;     pending interrupts.
;-----------------------------------------------------------------------------
;
;  ARGUMENTS: none
;
;  RETURNS: none
;
;  SIDE EFFECTS: REGISTERS ARE VOLATILE: THE A AND X REGISTERS MAY BE MODIFIED!
;
;  THEORY of OPERATION or PROCEDURE:
;
 I2Cs_ResumeInt:
_I2Cs_ResumeInt:
   RAM_PROLOGUE RAM_USE_CLASS_1
   jmp   ResumeEntry

 I2Cs_EnableInt:
_I2Cs_EnableInt:
   RAM_PROLOGUE RAM_USE_CLASS_1
   ;first clear any pending interrupts
   M8C_ClearIntFlag INT_CLR3, I2Cs_INT_MASK   
ResumeEntry:
   M8C_EnableIntMask I2Cs_INT_REG, I2Cs_INT_MASK
   RAM_EPILOGUE RAM_USE_CLASS_1
   ret

.ENDSECTION

.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: I2Cs_EnableSlave
;
;  DESCRIPTION:
;     Enables SDA interrupt allowing start condition detection. Remember to call the
;     global interrupt enable function by using the macro: M8C_EnableGInt.
;
;-----------------------------------------------------------------------------
;
;  ARGUMENTS: none
;
;  RETURNS: none
;
;  SIDE EFFECTS: REGISTERS ARE VOLATILE: THE A AND X REGISTERS MAY BE MODIFIED!
;
;  THEORY of OPERATION or PROCEDURE:
;

 I2Cs_EnableSlave:
_I2Cs_EnableSlave:

    RAM_PROLOGUE RAM_USE_CLASS_1
    
    IF (I2Cs_CY8C27XXXA_ID) ;; Enable this code if we have CY8C27XXXA chip ID
    ; Save original CPU clock speed
    M8C_SetBank1          ; Set Bank 1 
    mov  A,reg[OSC_CR0]   ; Get current configuration of OSC_CR0 (Bank 1)
    push A                ; Save OSC_CR0 configuration
    and  A,0xF8           ; Mask off CPU speed
    or   A,0x05           ; Set clock to 750KHz
    mov  reg[OSC_CR0],A   ; Write new value to OSC_CR0 (Bank 1)
    M8C_SetBank0          ; Back to Bank 0
    ENDIF 
    ; Enable I2C Slave
    IF(I2Cs_USED_I2C_BLOCK)
    M8C_SetBank1
    or   reg[I2Cs_CFG_REG],(I2Cs_CFG_Slave_EN | I2Cs_CFG_BUS_ERROR_IE | I2Cs_CFG_STOP_IE)
    M8C_SetBank0
    ELSE
    or   reg[I2Cs_CFG_REG],(I2Cs_CFG_Slave_EN | I2Cs_CFG_BUS_ERROR_IE | I2Cs_CFG_STOP_IE)
    ENDIF
    IF (I2Cs_CY8C27XXXA_ID) ;; Enable this code if we have CY8C27XXXA chip ID    
    ; Restore original CPU clock speed
    pop  A
    M8C_SetBank1          ; Set Bank 1
    mov  reg[OSC_CR0],A   ; Restore
    M8C_SetBank0          ; Back to Bank 0
    ENDIF    
    RAM_EPILOGUE RAM_USE_CLASS_1
    ret

.ENDSECTION

.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: I2Cs_DisableInt
;  FUNCTION NAME: I2Cs_Stop
;
;  DESCRIPTION:
;     Disables I2Cs slave by disabling SDA interrupt
;
;-----------------------------------------------------------------------------
;
;  ARGUMENTS: none
;
;  RETURNS: none
;
;  SIDE EFFECTS: REGISTERS ARE VOLATILE: THE A AND X REGISTERS MAY BE MODIFIED!
;
;  THEORY of OPERATION or PROCEDURE:
;

 I2Cs_Stop:
_I2Cs_Stop:
   RAM_PROLOGUE RAM_USE_CLASS_1

   M8C_DisableIntMask I2Cs_INT_REG, I2Cs_INT_MASK
   IF(I2Cs_USED_I2C_BLOCK)
   M8C_SetBank1
   and  reg[I2Cs_CFG_REG],~I2Cs_CFG_Slave_EN
   M8C_SetBank0
   ELSE
   and  reg[I2Cs_CFG_REG],~I2Cs_CFG_Slave_EN
   ENDIF
   RAM_EPILOGUE RAM_USE_CLASS_1
   ret

.ENDSECTION



.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: I2Cs_DisableInt
;  FUNCTION NAME: I2Cs_Stop
;
;  DESCRIPTION:
;     Disables I2Cs slave by disabling SDA interrupt
;
;-----------------------------------------------------------------------------
;
;  ARGUMENTS: none
;
;  RETURNS: none
;
;  SIDE EFFECTS: REGISTERS ARE VOLATILE: THE A AND X REGISTERS MAY BE MODIFIED!
;
;  THEORY of OPERATION or PROCEDURE:
;

 I2Cs_DisableInt:
_I2Cs_DisableInt:
   RAM_PROLOGUE RAM_USE_CLASS_1
   M8C_DisableIntMask I2Cs_INT_REG, I2Cs_INT_MASK
   RAM_EPILOGUE RAM_USE_CLASS_1
   ret

.ENDSECTION

.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: I2Cs_DisableSlave
;
;  DESCRIPTION:
;     Disables I2Cs slave by disabling SDA interrupt
;
;-----------------------------------------------------------------------------
;
;  ARGUMENTS: none
;
;  RETURNS: none
;
;  SIDE EFFECTS: REGISTERS ARE VOLATILE: THE A AND X REGISTERS MAY BE MODIFIED!
;
;  THEORY of OPERATION or PROCEDURE:
;

 I2Cs_DisableSlave:
_I2Cs_DisableSlave:
   RAM_PROLOGUE RAM_USE_CLASS_1
   IF(I2Cs_USED_I2C_BLOCK)
   M8C_SetBank1
   and  reg[I2Cs_CFG_REG],~I2Cs_CFG_Slave_EN
   M8C_SetBank0
   ELSE
   and  reg[I2Cs_CFG_REG],~I2Cs_CFG_Slave_EN
   ENDIF
   RAM_EPILOGUE RAM_USE_CLASS_1
   ret

.ENDSECTION

.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: 
;          void I2Cs_SetRamBuffer(BYTE bSize, BYTE bRWboundry, BYTE * pAddr)
;
;  DESCRIPTION:
;     Sets the location and size of the I2C RAM buffer.          
;
;-----------------------------------------------------------------------------
;
;  ARGUMENTS: 
;     [SP-3] =>  Size of data structure
;     [SP-4] =>  R/W boundary of (Must be less than or equal to size.)
;     [SP-5] =>  LSB of data pointer
;     [SP-6] =>  MSB of data pointer (Only used for large memory model)
;
;  RETURNS: none
;
;  SIDE EFFECTS;    
;    REGISTERS ARE VOLATILE: THE A AND X REGISTERS MAY BE MODIFIED!
;    IN THE LARGE MEMORY MODEL CURRENTLY ONLY THE PAGE POINTER 
;    REGISTERS LISTED BELOW ARE MODIFIED.  THIS DOES NOT GUARANTEE 
;    THAT IN FUTURE IMPLEMENTATIONS OF THIS FUNCTION OTHER PAGE POINTER 
;    REGISTERS WILL NOT BE MODIFIED.
;          
;    Page Pointer Registers Modified: 
;          CUR_PP
;
;  THEORY of OPERATION or PROCEDURE:
;

; Stack offset constants
RAMBUF_SIZE:   equ  -3   ; Stack position for data structure size.
RW_SIZE:       equ  -4   ; Stack position for R/W area size.       
RAMPTR_LSB:    equ  -5   ; Stack position for RAM pointer LSB.   
RAMPTR_MSB:    equ  -6   ; Stack position for RAM pointer MSB.   

 I2Cs_SetRamBuffer:
_I2Cs_SetRamBuffer:

    RAM_PROLOGUE RAM_USE_CLASS_4
    RAM_PROLOGUE RAM_USE_CLASS_2
    RAM_SETPAGE_CUR >I2Cs_bRAM_Buf_Size      ; Set page to global var page.
                                                        ; All these globals should be
                                                        ; on the same page.          
    mov   X,SP
    mov   A,[X+RAMBUF_SIZE]
    mov   [I2Cs_bRAM_Buf_Size],A             ; Store the buffer size

    mov   A,[X+RW_SIZE]                            ; Store R/W boundary             
    mov   [I2Cs_bRAM_Buf_WSize],A            ; 
    
    mov   A,[X+RAMPTR_LSB]                         ; Store only LSB of data pointer
    mov   [I2Cs_pRAM_Buf_Addr_LSB],A         ; 

IF (SYSTEM_LARGE_MEMORY_MODEL)                             ; Only worry about the address MSB
                                                           ; if in the large memory Model
    mov   A,[X+RAMPTR_MSB]                         ; Store only MSB of data pointer
    mov   [I2Cs_pRAM_Buf_Addr_MSB],A         ; 
ENDIF

    RAM_EPILOGUE RAM_USE_CLASS_2
    RAM_EPILOGUE RAM_USE_CLASS_4
    ret

.ENDSECTION

IF (I2Cs_ROM_ENABLE)  ;; Enable only if alternate ROM Address is Enabled
.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: 
;          void I2Cs_SetRomBuffer(BYTE bSize, BYTE * pAddr)
;
;  DESCRIPTION:
;     Sets the location and size of the I2C ROM buffer.          
;
;-----------------------------------------------------------------------------
;
;  ARGUMENTS: 
;     [SP-3] =>  Size of data const data structure
;     [SP-4] =>  LSB of data pointer
;     [SP-5] =>  MSB of data pointer (Only used for large memory model)
;
;  RETURNS: none
;
;  SIDE EFFECTS;    
;    REGISTERS ARE VOLATILE: THE A AND X REGISTERS MAY BE MODIFIED!
;    IN THE LARGE MEMORY MODEL CURRENTLY ONLY THE PAGE POINTER 
;    REGISTERS LISTED BELOW ARE MODIFIED.  THIS DOES NOT GUARANTEE 
;    THAT IN FUTURE IMPLEMENTATIONS OF THIS FUNCTION OTHER PAGE POINTER 
;    REGISTERS WILL NOT BE MODIFIED.
;          
;    Page Pointer Registers Modified: 
;          CUR_PP
;
;  THEORY of OPERATION or PROCEDURE:
;

; Stack offset constants
ROMBUF_SIZE:   equ  -3   ; Stack position for data structure size.
ROMPTR_LSB:    equ  -4   ; Stack position for ROM pointer LSB.   
ROMPTR_MSB:    equ  -5   ; Stack position for ROM pointer MSB.   

 I2Cs_SetRomBuffer:
_I2Cs_SetRomBuffer:

    RAM_PROLOGUE RAM_USE_CLASS_4
    RAM_PROLOGUE RAM_USE_CLASS_2
    RAM_SETPAGE_CUR >I2Cs_bROM_Buf_Size      ; Set page to global var page.
                                                        ; All these globals should be
                                                        ; on the same page.          
    mov   X,SP
    mov   A,[X+ROMBUF_SIZE]
    mov   [I2Cs_bROM_Buf_Size],A             ; Store the buffer size

    mov   A,[X+ROMPTR_LSB]                         ; Store LSB of data pointer
    mov   [I2Cs_pROM_Buf_Addr_LSB],A         ; 
    mov   A,[X+ROMPTR_MSB]                         ; Store MSB of data pointer
    mov   [I2Cs_pROM_Buf_Addr_MSB],A         ; 
    RAM_EPILOGUE RAM_USE_CLASS_2
    RAM_EPILOGUE RAM_USE_CLASS_4
    ret

.ENDSECTION
ENDIF

IF (I2Cs_CY8C22x45)
 .SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: void  I2Cs_EnableHWAddrCheck(void)
;
;  DESCRIPTION:
;   Set respective bit to engage the HardWare Address Recognition 
;   feature in I2C slave block.
;
;-----------------------------------------------------------------------------
;
;  ARGUMENTS: none
;
;  RETURNS: none
;
;  SIDE EFFECTS:
;    If the HardWare Address Recognition feature is enabled, the ROM registers reading does not work.
;    The HardWare Address Recognition feature should be disabled for using ROM registers.
;
;    The A and X registers may be modified by this or future implementations
;    of this function.  The same is true for all RAM page pointer registers in
;    the Large Memory Model.  When necessary, it is the calling function's
;    responsibility to perserve their values across calls to fastcall16 
;    functions.
;
 I2Cs_EnableHWAddrCheck:
_I2Cs_EnableHWAddrCheck:
   RAM_PROLOGUE RAM_USE_CLASS_1
   M8C_SetBank1
   or    reg[I2Cs_ADDR_REG], I2Cs_HW_ADDR_EN
   M8C_SetBank0
   RAM_EPILOGUE RAM_USE_CLASS_1
   ret
.ENDSECTION

.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: void  I2Cs_DisableHWAddrCheck(void)
;
;  DESCRIPTION:
;   Clear respective bit to disengage the HardWare Address Recognition 
;   feature in I2C slave block.
;
;-----------------------------------------------------------------------------
;
;  ARGUMENTS: none
;
;  RETURNS: none
;
;  SIDE EFFECTS:
;    The A and X registers may be modified by this or future implementations
;    of this function.  The same is true for all RAM page pointer registers in
;    the Large Memory Model.  When necessary, it is the calling function's
;    responsibility to perserve their values across calls to fastcall16 
;    functions.
;
 I2Cs_DisableHWAddrCheck:
_I2Cs_DisableHWAddrCheck:
   RAM_PROLOGUE RAM_USE_CLASS_1
   M8C_SetBank1
   and   reg[I2Cs_ADDR_REG], ~I2Cs_HW_ADDR_EN
   M8C_SetBank0
   RAM_EPILOGUE RAM_USE_CLASS_1
   ret
.ENDSECTION
ENDIF

; End of File I2Cs.asm
