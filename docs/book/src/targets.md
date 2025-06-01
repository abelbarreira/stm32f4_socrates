# Targets

In addition to STM32F4, this project is considering **SecurCore® SC000™** and **SecurCore® SC300™** targets during the toolchain and building environment definition. The reason is that SecurCore® is using ARM Compiler 5.x from Keil MDK-ARM so it is a very hardware-specific and security-sensitive toolchain. This is adding a good example of how to give more flexibility to the building environment.

## Cross-Platform

Use CMake or Makefiles with toolchain files to abstract platform differences.

## Hardware Target List

| MCU               | ARM Arch | Cortex                      | Toolchain    | Compiler                    | Build       | License     | Notes                           |
| ----------------- | -------- | --------------------------- | ------------ | --------------------------- | ----------- | ----------- | ------------------------------- |
| Samsung S3Dx/S3Fx | ARMv6-M  | SecurCore® SC000™ Cortex-M0 | Keil MDK-ARM | armcc, armasm, armlink      | make, cmake | Proprietary | ARM Compiler 5.x                |
| ST ST31Gx         |          |                             |              |                             |             |             |                                 |
|                   |          |                             |              |                             |             |             |                                 |
| ST ST32x/33x      | ARMv7-M  | SecurCore® SC300™ Cortex-M3 | Keil MDK-ARM | armcc, armasm, armlink      | make, cmake | Proprietary | ARM Compiler 5.x                |
|                   |          |                             | ARM GNU GCC  | arm-none-eabi-gcc, -as, -ld | make, cmake | Open Source | [MSYS2](https://www.msys2.org/) |
|                   |          |                             |              |                             |             |             |                                 |
| ST STM32F4        | ARMv7-M  | Cortex-M4                   | ARM GNU GCC  | arm-none-eabi-gcc, -as, -ld | make, cmake | Open Source | [MSYS2](https://www.msys2.org/) |
|                   |          |                             |              |                             |             |             |                                 |

## Host-Side Simulation

| Platform | Toolchain   | Compiler | Build       | License     | Notes                           |
| -------- | ----------- | -------- | ----------- | ----------- | ------------------------------- |
| Windows  | ARM GNU GCC | gcc, g++ | make, cmake | Open Source | [MSYS2](https://www.msys2.org/) |
|          |             |          |             |             |                                 |
| Ubuntu   | ARM GNU GCC | gcc, g++ | make, cmake | Open Source | Native gcc, g++, make and cmake |

## Compilation Features: Code Coverage

Code coverage will be done using GCC Gcov. This is easy to implement in the Host-Side Simulation.

In case is needed to have coverage for the HAL layer in the HW Targets themselves, it is possible to implement in `arm-none-eabi-gcc` exporting `.gcda` and `.gcno` using UART Serial, but not in `armcc`.
