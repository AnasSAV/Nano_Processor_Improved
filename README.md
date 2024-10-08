# Nano_Processor
 Developed a 4-bit nano processor capable of executing a simple set of instructions. The design of this processor involved the creation of various essential components, each contributing to the overall functionality and performance of the system.

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
