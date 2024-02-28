# Next Gen Blinky (Example FPGA Project)
## Introduction
Next Gen Blinky (NGB) is an FPGA design meant to serve as a reference for future FPGA projects as well as a place to experiment with new development styles, architectures, techniques, toolchains, etc.  NGB is an expanded version of a [blinky or HELLO WORLD](https://zipcpu.com/blog/2017/05/19/blinky.html) project used to first bring up an FPGA board.  In addition to the standard blinking LED, NGB has a serial port connected to a register bank, some memory, and additional LEDs.

## NGB Features
* 48MHz system clock
* 1 Hz always on "blinky" LED
* additional controllable LEDs
* switch/button inputs
* UART port with loopback mode
* register bank
* scratchpad memory
* debug gpio pins

## System Block Diagram
TODO

## Target Hardware
[Lattice Certus-NX Eval Board](https://www.latticesemi.com/products/developmentboardsandkits/cnx_evk)

# Getting Started
## Directory Structure
[docs](/docs/README.md) - project documentation\
[rtl](/rtl/README.md) - module and top level design and implementation\
[scripts](/scripts/README.md) - scripts used to setup the project, run simulations, build, etc
[sim](/sim/README.md) - simulation

## Project Environment
* OS: ubuntu 20.04 on [WSL2](https://learn.microsoft.com/en-us/windows/wsl/about), Win 11 host
* version control: git
* python: 3.10.8 (your mileage my vary with other versions)
* simulator: modelsim
* FPGA toolchain: Radiant 3.2.0.8

## Project Setup
* setup and update os
* clone project git repo

### Python Setup
I use [pipenv](https://pipenv.pypa.io/en/latest/index.html) to manage python dependencies and virtual environments with minimal overhead thinking.

## Running Simulations
### Module Level
TODO

### Top Level
TODO

### Full Test Suite CI/CD
TODO

## Building the FPGA
TODO

# Project Status
TODO

# References
TODO