# Nanoprocessor Design Project

## Overview

This project involves the design and development of a 4-bit nanoprocessor capable of executing basic arithmetic and logical operations. We have designed essential components such as a Program ROM, Buses, Instruction Decoder, Program Counter, Register Bank, and Arithmetic Units. In the improved version, additional functionality such as multiplication, bit comparison, and bit shifting was introduced.

## Components

### 1. Program ROM
The Program ROM serves as storage for the assembly program, which dictates the sequence of operations executed by the processor.

### 2. Buses
Buses are used for transferring data and instructions between the components of the nanoprocessor.

### 3. Instruction Decoder
The Instruction Decoder decodes the instructions from the Program ROM and generates control signals to guide the processor's operation.

### 4. Program Counter (PC)
The PC holds the address of the next instruction and ensures sequential instruction execution by updating its value after each operation.

### 5. Register Bank
This component holds 4-bit values that are used during arithmetic and logical operations, providing temporary storage for quick access.

### 6. Multiplexers
Multiplexers route data within the processor by selecting inputs based on control signals, allowing efficient data flow.

### 7. 4-bit Add/Subtract Unit
This unit performs arithmetic operations on 4-bit numbers in 2's complement representation.

### 8. 3-bit Adder
Used to increment the Program Counter to fetch the next instruction.

## Execution Process

1. **Program Loading:** The assembly program is loaded into the Program ROM.
2. **Instruction Fetch:** The Program Counter fetches instructions from ROM.
3. **Instruction Decoding:** The Instruction Decoder decodes the instruction.
4. **Data Manipulation:** The instruction manipulates data in registers, if necessary.
5. **Arithmetic Operations:** Operations such as addition and subtraction are performed.
6. **Program Counter Update:** The PC is updated after each instruction.

## Improved Nanoprocessor Design

The improved version introduces new components:

- **4-bit Multiplier:** For multiplication of register values.
- **Bit Comparator:** Compares register values, outputting the result via LEDs.
- **AND Operator:** Executes logical AND operations.
- **Bit Shifter:** Shifts bits in a chosen register.
- **Operator Interface:** Manages communication between the processor's units.

## Supported Instructions

| Instruction | Description |
|-------------|-------------|
| `MOVI R, d` | Move immediate value `d` to register `R`. |
| `ADD Ra, Rb` | Add values in registers `Ra` and `Rb`, storing the result in `Ra`. |
| `NEG R` | Perform 2's complement negation on register `R`. |
| `JZR R, d` | Jump if the value in register `R` is zero. |
| `MUL Ra, Rb` | Multiply the values in registers `Ra` and `Rb`. |
| `COM Ra, Rb` | Compare values in registers `Ra` and `Rb`, output result via LEDs. |
| `DOT Ra, Rb` | Perform AND operation on values in `Ra` and `Rb`. |
| `SHIF R` | Shift bits stored in register `R`. |

## Usage

1. Load your assembly program into the Program ROM.
2. Run the nanoprocessor simulation or hardware implementation.
3. View output via LEDs or other display units to verify correct execution of operations.

## How to Use the Repository

### 1. Clone the Repository

To get started with the project, first, clone the repository from GitHub using the following command:
git clone https://github.com/AnasSAV/Nano_Processor_Improved.git

### 2. Open the Project

If you are using an IDE like Vivado, open the .xpr project file using the following steps:
- In Vivado, go to File > Open Project.
- Select the Nano_processor.xpr file from the cloned repository.

### 3. Set Up the Simulation

To run the simulation:

- Navigate to the sim directory in Vivado.
- Run the Behavioral Simulation by selecting the testbench files and setting up the appropriate simulation parameters.
- You can modify and test different assembly programs by editing the Program ROM in the source code.
  
### 4. Running on FPGA 

If you're implementing the nanoprocessor on an FPGA:

- Synthesize the design in Vivado or another supported tool.
- Generate the bitstream and upload it to your FPGA board.
- Monitor the outputs such as arithmetic operation results or logical comparisons through output devices like LEDs or seven-segment displays.
  
### 5. Modifying the Design

If you want to make changes or add features to the nanoprocessor:

- Edit the HDL code in the srcs folder to implement new instructions or improve the existing components.
- Simulate the updated design in Vivado to ensure the modifications work correctly.
  
### 6. Testing

You can test the nanoprocessor’s functionality by running different assembly instructions, such as MOVI, ADD, MUL, etc.

- Check the Instruction Decoder, Arithmetic Unit, Register Bank, and other components to ensure they are functioning as expected.
- Use testbenches to automate the validation of different instructions and components.
  
## Contributing
Contributions to the project are welcome! If you'd like to improve functionality or add new features:

## Fork the repository.
- Create a new branch with your feature or fix.
- Submit a pull request, and we’ll review it.
- Feel free to also open issues if you spot bugs or have suggestions.
