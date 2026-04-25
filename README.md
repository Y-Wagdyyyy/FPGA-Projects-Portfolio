# FPGA & Digital Design Portfolio
Welcome to my FPGA and Digital Design projects portfolio.
A structured portfolio showcasing FPGA-based digital design projects developed with Vivado, covering RTL design, simulation, and system-level implementations.

---

## 🛠 Tools & Technologies

* Vivado (Xilinx)
* Verilog / VHDL
* FPGA Development Boards (e.g., Basys 3)
* Simulation & Testbenches

---

## 📂 Projects

### 🔹 1. FPGA Sine Wave Generator (BRAM LUT)

* **Description:** Memory-based sine wave generator on FPGA using BRAM and LUT approach
* **Tools:** Vivado, Verilog, MATLAB
* **Features:**

  * BRAM-based waveform generation
  * Precomputed sine samples using .coe file
  * Binary counter for sequential addressing
  * Low-latency LUT-based design (DDS concept)
  * 8-bit digital sine output
* 🔗 [Repository](https://github.com/Y-Wagdyyyy/FPGA-Projects-Portfolio/tree/main/1.%20FPGA-Sine-Wave-Generator-BRAM)

---

### 🔹 2. (111) Overlapping Sequence Detector

* **Description:** FPGA-based overlapping sequence detector that identifies the pattern “111” in a serial input stream using an FSM design
* **Tools:** Vivado, Verilog
* **Features:**
  
  * Finite State Machine (FSM) implementation
  * Overlapping sequence detection (1111 → two detections)
  * Mealy-style output for zero-latency detection
  * Fully synchronous RTL design
  * Verified using testbench simulation
  * Timing-constrained and validated for hardware   
* 🔗 [Repository](https://github.com/Y-Wagdyyyy/FPGA-Projects-Portfolio/tree/main/2.%20(111)Overlapping_Sequence_Detector)) 

---

### 🔹 3. UART Transceiver

* **Description:** Custom UART transceiver designed from scratch using Verilog, including both transmitter and receiver modules with a shared baud rate generator and full loopback verification.
* **Tools:** Vivado, Verilog, Testbench Simulation
* **Features:**
* Full UART frame implementation (Start + 8 Data + Stop)
* Baud rate generator using clock divider (bitDone trigger)
* Transmitter FSM (TX) for serial data output
* Receiver FSM (RX) with mid-bit sampling
* LSB-first data transmission
* Loopback testing (TX → RX)
* Randomized testbench for verification
* Correct data reconstruction (txin == rxout)
* Clean FSM-based RTL design

* **Key Design Insights::**
* Timing is controlled using a baud counter (no shared clock line)
* RX samples at mid-bit for reliable data capture
* Output data is only valid when rxdone = 1
* Shared timing simplifies design but differs from real hardware implementations

🔗 Repository

---

## 📬 Contact

* LinkedIn: https://www.linkedin.com/in/youssef-w-roshdy/
* Email: youssefwagdy68@gmail.com
