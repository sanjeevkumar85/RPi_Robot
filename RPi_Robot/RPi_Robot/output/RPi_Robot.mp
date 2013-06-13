Project:      output/RPi_Robot
Build Number: 0
Date:         Thu Jun 13 23:44:45 2013
Compiler:     ICCM8C
Version:      8.05.01E


Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   01A0   00F6 =    246. bytes (rel,con,rom,lit)

       Addr  Global Symbol
      -----  --------------------------------
       01A0  _RangeTable
       01BE  LoadConfigTBL_rpi_robot_Bank0
       0247  LoadConfigTBL_rpi_robot_Bank1
       0296  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                        func_lit   0296   0002 =      2. bytes (rel,con,rom,proclab)

       Addr  Global Symbol
      -----  --------------------------------
       0296  __func_lit_start
       0298  __func_lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     psoc_config   0298   0167 =    359. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       0298  LoadConfigTBL_rpi_robot_Ordered
       039D  _LoadConfigInit
       039D  LoadConfigInit
       03A4  _LoadConfig_rpi_robot
       03A4  LoadConfig_rpi_robot
       03FF  __psoc_config_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     UserModules   03FF   043C =   1084. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       03FF  _Servo_PWM_ISR
       0400  Servo_PWM_EnableInt
       0400  _Servo_PWM_EnableInt
       0404  Servo_PWM_DisableInt
       0404  _Servo_PWM_DisableInt
       0408  Servo_PWM_Start
       0408  _Servo_PWM_Start
       040C  Servo_PWM_Stop
       040C  _Servo_PWM_Stop
       0410  _Servo_PWM_WritePeriod
       0410  Servo_PWM_WritePeriod
       0416  Servo_PWM_WritePulseWidth
       0416  _Servo_PWM_WritePulseWidth
       041C  Servo_PWM_wReadPulseWidth
       041C  wServo_PWM_ReadPulseWidth
       041C  _wServo_PWM_ReadPulseWidth
       041C  _Servo_PWM_wReadPulseWidth
       0422  wServo_PWM_ReadCounter
       0422  _Servo_PWM_wReadCounter
       0422  Servo_PWM_wReadCounter
       0422  _wServo_PWM_ReadCounter
       045C  _Range_PGA_SetPower
       045C  Range_PGA_SetPower
       045C  _Range_PGA_Start
       045C  Range_PGA_Start
       046E  Range_PGA_SetGain
       046E  _Range_PGA_SetGain
       0498  _Range_PGA_Stop
       0498  Range_PGA_Stop
       049C  _Range_ADC_ADConversion_ISR
       050A  _Range_ADC_Start
       050A  Range_ADC_Start
       0519  _Range_ADC_SetPower
       0519  Range_ADC_SetPower
       052B  _Range_ADC_Stop
       052B  Range_ADC_Stop
       0535  Range_ADC_GetSamples
       0535  _Range_ADC_GetSamples
       055E  Range_ADC_StopADC
       055E  _Range_ADC_StopADC
       0572  Range_ADC_fIsDataAvailable
       0572  _Range_ADC_fIsDataAvailable
       0578  _Range_ADC_wClearFlagGetData
       0578  _Range_ADC_iClearFlagGetData
       0578  Range_ADC_iClearFlagGetData
       0578  Range_ADC_wClearFlagGetData
       0588  _Range_ADC_bClearFlagGetData
       0588  Range_ADC_cClearFlagGetData
       0588  _Range_ADC_cClearFlagGetData
       0588  Range_ADC_bClearFlagGetData
       0591  Range_ADC_wGetData
       0591  _Range_ADC_wGetData
       0591  Range_ADC_iGetData
       0591  _Range_ADC_iGetData
       0599  _Range_ADC_bGetData
       0599  Range_ADC_cGetData
       0599  Range_ADC_bGetData
       0599  _Range_ADC_cGetData
       059F  Range_ADC_fClearFlag
       059F  _Range_ADC_fClearFlag
       05A8  Range_ADC_WritePulseWidth
       05A8  _Range_ADC_WritePulseWidth
       05AB  _I2Cs_ISR
       068E  _I2Cs_Start
       068E  I2Cs_Start
       06BF  I2Cs_GetActivity
       06BF  _I2Cs_GetActivity
       06CA  I2Cs_GetAddr
       06CA  _I2Cs_GetAddr
       06CD  _I2Cs_ResumeInt
       06CD  I2Cs_ResumeInt
       06CF  _I2Cs_EnableInt
       06CF  I2Cs_EnableInt
       06DA  _I2Cs_Stop
       06DA  I2Cs_Stop
       06E1  _I2Cs_DisableInt
       06E1  I2Cs_DisableInt
       06E5  I2Cs_DisableSlave
       06E5  _I2Cs_DisableSlave
       06E9  _I2Cs_SetRamBuffer
       06E9  I2Cs_SetRamBuffer
       0702  _BackRightMotor_P_ISR
       0703  BackRightMotor_P_EnableInt
       0703  _BackRightMotor_P_EnableInt
       0707  _BackRightMotor_P_DisableInt
       0707  BackRightMotor_P_DisableInt
       070B  _BackRightMotor_P_Start
       070B  BackRightMotor_P_Start
       070F  BackRightMotor_P_Stop
       070F  _BackRightMotor_P_Stop
       0713  _BackRightMotor_P_WritePeriod
       0713  BackRightMotor_P_WritePeriod
       0716  BackRightMotor_P_WritePulseWidth
       0716  _BackRightMotor_P_WritePulseWidth
       0719  _bBackRightMotor_P_ReadPulseWidth
       0719  BackRightMotor_P_bReadPulseWidth
       0719  _BackRightMotor_P_bReadPulseWidth
       0719  bBackRightMotor_P_ReadPulseWidth
       071C  BackRightMotor_P_bReadCounter
       071C  _bBackRightMotor_P_ReadCounter
       071C  _BackRightMotor_P_bReadCounter
       071C  bBackRightMotor_P_ReadCounter
       0749  _BackRightMotor_N_ISR
       074A  _BackRightMotor_N_EnableInt
       074A  BackRightMotor_N_EnableInt
       074E  BackRightMotor_N_DisableInt
       074E  _BackRightMotor_N_DisableInt
       0752  _BackRightMotor_N_Start
       0752  BackRightMotor_N_Start
       0756  BackRightMotor_N_Stop
       0756  _BackRightMotor_N_Stop
       075A  _BackRightMotor_N_WritePeriod
       075A  BackRightMotor_N_WritePeriod
       075D  BackRightMotor_N_WritePulseWidth
       075D  _BackRightMotor_N_WritePulseWidth
       0760  bBackRightMotor_N_ReadPulseWidth
       0760  _BackRightMotor_N_bReadPulseWidth
       0760  _bBackRightMotor_N_ReadPulseWidth
       0760  BackRightMotor_N_bReadPulseWidth
       0763  BackRightMotor_N_bReadCounter
       0763  _bBackRightMotor_N_ReadCounter
       0763  bBackRightMotor_N_ReadCounter
       0763  _BackRightMotor_N_bReadCounter
       0790  _BackLeftMotor_P_ISR
       0791  _BackLeftMotor_P_EnableInt
       0791  BackLeftMotor_P_EnableInt
       0795  BackLeftMotor_P_DisableInt
       0795  _BackLeftMotor_P_DisableInt
       0799  BackLeftMotor_P_Start
       0799  _BackLeftMotor_P_Start
       079D  BackLeftMotor_P_Stop
       079D  _BackLeftMotor_P_Stop
       07A1  BackLeftMotor_P_WritePeriod
       07A1  _BackLeftMotor_P_WritePeriod
       07A4  BackLeftMotor_P_WritePulseWidth
       07A4  _BackLeftMotor_P_WritePulseWidth
       07A7  BackLeftMotor_P_bReadPulseWidth
       07A7  bBackLeftMotor_P_ReadPulseWidth
       07A7  _BackLeftMotor_P_bReadPulseWidth
       07A7  _bBackLeftMotor_P_ReadPulseWidth
       07AA  _BackLeftMotor_P_bReadCounter
       07AA  bBackLeftMotor_P_ReadCounter
       07AA  BackLeftMotor_P_bReadCounter
       07AA  _bBackLeftMotor_P_ReadCounter
       07D7  _BackLeftMotor_N_ISR
       07D8  _BackLeftMotor_N_EnableInt
       07D8  BackLeftMotor_N_EnableInt
       07DC  _BackLeftMotor_N_DisableInt
       07DC  BackLeftMotor_N_DisableInt
       07E0  _BackLeftMotor_N_Start
       07E0  BackLeftMotor_N_Start
       07E4  BackLeftMotor_N_Stop
       07E4  _BackLeftMotor_N_Stop
       07E8  _BackLeftMotor_N_WritePeriod
       07E8  BackLeftMotor_N_WritePeriod
       07EB  _BackLeftMotor_N_WritePulseWidth
       07EB  BackLeftMotor_N_WritePulseWidth
       07EE  bBackLeftMotor_N_ReadPulseWidth
       07EE  _bBackLeftMotor_N_ReadPulseWidth
       07EE  _BackLeftMotor_N_bReadPulseWidth
       07EE  BackLeftMotor_N_bReadPulseWidth
       07F1  BackLeftMotor_N_bReadCounter
       07F1  _BackLeftMotor_N_bReadCounter
       07F1  bBackLeftMotor_N_ReadCounter
       07F1  _bBackLeftMotor_N_ReadCounter
       081E  _AMUX4_InputSelect
       081E  AMUX4_InputSelect
       0839  AMUX4_Start
       0839  _AMUX4_Start
       083A  _AMUX4_Stop
       083A  AMUX4_Stop
       083B  __UserModules_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   083B   056D =   1389. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       083B  __text_start
       083B  _Delay10msTimes
       083B  Delay10msTimes
       0848  _Delay50uTimes
       0848  Delay50uTimes
       084E  Delay50u_Table
       0856  Delay50u
       0856  _Delay50u
       086A  _main
       087C  _Intialize
       08A8  _Motor_Control
       097C  _Measure_Distance
       09B7  _Lookup_Distance
       0B76  _Obstacle_Detection
       0BF1  _Turn_RangeSensor
       0D9E  __lpmw
       0DA8  __text_end
       0DA8  __xidata_start
       0DB3  __xidata_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             TOP   0000   0167 =    359. bytes (abs,ovr,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       0068  __Start
       0164  _bGetPowerSetting
       0164  bGetPowerSetting

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                    InterruptRAM   0000   0010 =     16. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  _Range_ADC_iResult
       0000  Range_ADC_iResult
       0004  _Range_ADC_fStatus
       0004  Range_ADC_fStatus
       0005  Range_ADC_bState
       0005  _Range_ADC_bState
       0006  _Range_ADC_fMode
       0006  Range_ADC_fMode
       0007  _Range_ADC_bNumSamples
       0007  Range_ADC_bNumSamples
       0008  _I2Cs_varPage
       0008  I2Cs_varPage
       0008  _I2Cs_bState
       0008  _NO_SHADOW
       0008  NO_SHADOW
       0008  I2Cs_bState
       0009  I2Cs_bRAM_RWoffset
       0009  _I2Cs_bRAM_RWoffset
       000A  _I2Cs_bRAM_RWcntr
       000A  I2Cs_bRAM_RWcntr
       000B  _I2Cs_pRAM_Buf_Addr_MSB
       000B  I2Cs_pRAM_Buf_Addr_MSB
       000C  _I2Cs_pRAM_Buf_Addr_LSB
       000C  I2Cs_pRAM_Buf_Addr_LSB
       000D  _I2Cs_bRAM_Buf_Size
       000D  I2Cs_bRAM_Buf_Size
       000E  I2Cs_bRAM_Buf_WSize
       000E  _I2Cs_bRAM_Buf_WSize
       000F  _I2Cs_bBusy_Flag
       000F  I2Cs_bBusy_Flag

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
               virtual_registers   0010   0007 =      7. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0010  __rZ
       0011  __rY
       0012  __rX
       0013  __r3
       0014  __r2
       0015  __r1
       0016  __r0

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0000   0006 =      6. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  __data_start
       0017  _lRangeTable
       0019  _i
       001B  _Robot_Paras

Files Linked      [ module(s) ]

./obj/boot.o	[ boot.asm ]
obj/delay.o	[ delay.asm ]
obj/main.o	[ main.c ]
<library>	[ servo_pwmint.asm, servo_pwm.asm, range_pga.asm, range_adcint.asm, range_adc.asm, psocconfigtbl.asm ]
[ psocconfig.asm, i2csint.asm, i2cs.asm, backrightmotor_pint.asm, backrightmotor_p.asm, backrightmotor_nint.asm ]
[ backrightmotor_n.asm, backleftmotor_pint.asm, backleftmotor_p.asm, backleftmotor_nint.asm ]
[ backleftmotor_n.asm, amux4.asm, rZ.asm, rY.asm, rX.asm, r3.asm, r2.asm, r1.asm, r0.asm, divmod_16x16_16_util.asm ]
[ fp2long_util.asm, i_div16_block_util.asm, i_div32_not_util.asm, long2fp_util.asm, mul16_util.asm ]
[ lpmw.s ]

Area Definitions

-blit:0x1a0.0x7fff
-bdata:0.0x6ff
-BInterruptRAM:0	allocated at: 0
-Bvirtual_registers	allocated at: 0x10
-Brpi_robot_RAM	allocated at: 0
-rwh:SSCParmBlk:0xf7.0xff

