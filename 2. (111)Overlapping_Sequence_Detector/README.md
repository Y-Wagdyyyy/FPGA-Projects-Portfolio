# 🔍 FPGA Overlapping Sequence Detector (“111”) – Artix-7 (Verilog, Vivado)

This project implements an **overlapping sequence detector** on FPGA using **Verilog HDL**.

Instead of missing repeated patterns, the design ensures **continuous detection** of the sequence **“111”** in a serial input stream.

---

## 📊 Simulation Result

![Simulation Result](https://github.com/Y-Wagdyyyy/FPGA-Projects-Portfolio/blob/main/2.%(111)Overlapping_Sequence_Detector/images/Capture.JPG)

![Sine Wave Output](https://github.com/Y-Wagdyyyy/FPGA-Projects-Portfolio/blob/main/1.%20FPGA-Sine-Wave-Generator-BRAM/Images/Capture1.JPG)


---

## 🧠 Concept

A **Finite State Machine (FSM)** monitors the input stream and detects three consecutive '1' bits.

This design supports **overlapping detection**:

* `111` → one detection  
* `1111` → two detections  

The implementation follows a **Mealy-style approach**:

* Output depends on **state + input**
* Detection occurs **immediately (no extra cycle delay)**

---

## 🧩 Architecture

* FSM States:
  * **S0 (Idle)** → No relevant bits  
  * **S1** → First ‘1’ detected  
  * **S2** → Two consecutive ‘1’s  

* Transition Logic:
  * `din = 1` → move forward  
  * `din = 0` → reset to Idle  

* Output:
  * Asserted on the third consecutive '1'  
  * Supports **overlapping sequences**

---

## 🛠 Tools & Technologies

* Vivado (Xilinx)
* Verilog HDL
* Artix-7 FPGA (xc7a100t)
* XDC timing constraints

---

## ⚙️ Design Details

* **Inputs**
  * `clk` → System clock  
  * `rst` → Synchronous reset  
  * `din` → Serial input  

* **Output**
  * `dout` → High when “111” is detected  

* **Features**
  * Fully synchronous design  
  * Uses non-blocking assignments (`<=`)  
  * Deterministic startup using reset  
  * Clean simulation (no undefined states)  

---

## 🧪 Verification

Testbench includes multiple input patterns:

* `000` → No detection  
* `111` → Single detection  
* `1111` → Overlapping detection  
* Mixed sequences  

* Correct functionality verified  
* Overlapping detection confirmed  
* Reset removes undefined (`X`) states  

---

## ⏱ Timing & Constraints

* Clock constraint:

```
create_clock -period 10 [get_ports clk]
```

* Results:

  * No timing violations  
  * Positive slack (WNS > 0)  
  * Design meets timing requirements  

---

## 🧩 Hardware Implementation

* `din` → Switch input  
* `dout` → LED output  

* Behavior:

  * LED turns ON when “111” is detected  
  * Overlapping inputs produce multiple detections  

---

## 💡 Key Insights

* FSMs are efficient for real-time pattern detection  
* Mealy design reduces latency  
* Reset is critical for reliable startup  
* Timing constraints are essential for FPGA deployment  

---

## 📂 Repository Structure

```
src/            → Verilog files
tb/             → Testbench
constraints/    → XDC file
images/         → Waveforms & diagrams
```

---

## 🚀 Future Improvements

* Parameterized sequence detector  
* Programmable pattern support  
* Input debouncing  
* Integration with communication systems  
* On-chip debugging using ILA  

---

## 📬 Contact

* LinkedIn: https://www.linkedin.com/in/youssef-w-roshdy/  
* Email: youssefwagdy68@gmail.com  
