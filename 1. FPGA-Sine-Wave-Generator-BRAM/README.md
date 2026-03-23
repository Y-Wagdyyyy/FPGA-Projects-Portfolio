# 🎛 FPGA Sine Wave Generator using BRAM (Vivado)

This project implements a **memory-based sine wave generator** on FPGA using **Block RAM (BRAM)** and a **lookup table (LUT) approach**.

Instead of computing sine values in real-time, precomputed samples are stored in memory and accessed sequentially to generate a waveform efficiently.

---

## 🧠 Concept

A **binary counter** generates addresses that index a BRAM containing quantized sine values.
This produces a deterministic and low-latency sine waveform — a common technique used in **Direct Digital Synthesis (DDS)** systems.

---

## 🧩 Architecture

* Binary Counter → Generates address
* BRAM (Block Memory Generator) → Stores sine samples
* Output → 8-bit digital sine waveform

---

## 🛠 Tools & Technologies

* Vivado (Xilinx)
* Verilog (wrapper if used)
* Block Memory Generator IP
* MATLAB (for generating .coe file)

---

## ⚙️ Design Details

* 8-bit sine wave quantization
* Clock-driven sequential memory access
* Precomputed samples stored using `.coe` file
* Functional simulation performed in Vivado

---

## 📊 Result

The output waveform shows a **clean sampled sine wave**, confirming:

* Correct memory initialization
* Proper timing between address and data

---

## 💡 Key Insights

* LUT-based design avoids expensive real-time computation
* Increasing samples → better accuracy but more memory usage
* Widely used in:

  * DSP systems
  * Communication systems
  * FPGA-based waveform generation

---

## 📂 Repository Structure

```
src/            → Verilog / HDL files (if any)
coe/            → Memory initialization file (.coe)
matlab/         → MATLAB script for sine generation
images/         → Block design & simulation screenshots
tcl/            → (optional) project recreation scripts
```

---

## 🚀 Future Improvements

* Interface with DAC for analog output
* Add frequency control
* Implement phase accumulator (DDS upgrade)

---

## 📬 Contact

* LinkedIn: https://www.linkedin.com/in/youssef-w-roshdy/
* Email: youssefwagdy68@gmail.com
