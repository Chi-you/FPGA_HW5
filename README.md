# FPGA HW5 

HW5 of FPGA design in NCKU

## Project hierarchy
```
FPGA-HW5/
├── Problem1
│   ├── src
│   ├── xdc
│   ├── xsa
│   └── vitis project
└── README.md
```
## BRAM and DSP description
* BRAM 
  * Two BRAMs have specific initial value
  * Read/Write port: 
   
    ![image](https://user-images.githubusercontent.com/47135258/168457807-8e6bbd03-8ffb-48e7-975f-e979e976c03d.png)

* DSP
  * Data input: port A, B
  * Data output: port P
  * port C: constant number 0x0000_0009_5514
  * control signal: INMODE, OPMODE, ALUMODE. Set CARRYINSEL to 000 and CARRYIN to 0.
  * Pipeline register: AREG, BREG, PREG at least 1
