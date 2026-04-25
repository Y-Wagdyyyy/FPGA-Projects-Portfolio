# 🔍 UART Transceiver on FPGA (From Scratch) – Verilog & Vivado

This project implements a complete **UART (Universal Asynchronous Receiver/Transmitter)** communication system from scratch using **Verilog HDL**.

Unlike designs that rely on pre-built IP cores, this implementation builds the **Transmitter (TX)**, **Receiver (RX)**, and **Baud Rate Generator** from the ground up to demonstrate fundamental digital communication principles.

---

## 📊 Simulation Result

> [!TIP]
> **Waveform Behavior:** During reception, `rxout` updates bit-by-bit (e.g., `00` → `80` → `C0`). The data is only considered **valid** when `rxdone` is asserted, at which point `txin == rxout`.


---

## 🧠 Concept

UART is an asynchronous protocol, meaning it operates without a shared clock line. The core challenge is maintaining **timing accuracy** between two independent devices.

* **Frame Format:** 10 bits total (1 Start bit, 8 Data bits, 1 Stop bit).
* **Order:** LSB (Least Significant Bit) is transmitted first.
* **Sampling:** The receiver uses **mid-bit sampling** to ensure data integrity and account for slight frequency drifts.

---

## 🧩 Architecture

The system is divided into three primary functional blocks:

* **Baud Rate Generator:** * A clock divider that produces a `bitDone` pulse.
    * This pulse synchronizes the timing for both the TX and RX state machines.
* **Transmitter (TX FSM):** * **IDLE:** Waits for the start signal.
    * **SEND:** Drives the serial line with the current bit.
    * **CHECK:** Monitors `bitDone` to transition to the next bit index.
* **Receiver (RX FSM):** * **RIDLE:** Detects the falling edge (Start bit).
    * **RWAIT:** Waits for half a baud period to align with the **center** of the bit.
    * **RECV:** Samples and shifts incoming bits into a register.

---

## 🛠 Tools & Technologies

* Vivado (Xilinx)
* Verilog HDL
* FPGA Board (e.g., Artix-7 / Basys 3)
* Simulation Testbench

---

## ⚙️ Design Details

* **Inputs**
    * `clk` → System clock
    * `rst` → System reset
    * `txin [7:0]` → Parallel data to be sent
    * `txstart` → Trigger for transmission

* **Outputs**
    * `tx` → Serial output line
    * `rxout [7:0]` → Reconstructed parallel data
    * `rxdone` → Data valid flag

* **Features**
    * FSM-based sequential logic.
    * Mid-bit sampling for high reliability.
    * Self-checking loopback capability.

---

## 🧪 Verification

The design was verified using a **Randomized Testbench**:

* **Loopback Test:** The `tx` output was directly tied to the `rx` input to validate the full chain.
* **Random Data:** Tested multiple frames using `$urandom_range(10, 200)` to ensure consistency.
* **Validation:** Automated checks confirmed that `txin` matched `rxout` only when `rxdone` was high.

---

## ⏱ Timing & Constraints

* **Baud Timing:** Accurate sampling is achieved by dividing the system clock to the desired baud rate (e.g., 9600 or 115200).
* **Synchronization:** All transitions are synchronous to the FPGA system clock to avoid glitches.

---

## 💡 Key Insights

* **Timing is King:** In asynchronous protocols, sampling position is more critical than logic complexity.
* **Center Alignment:** Sampling at the 50% mark of a bit period provides the maximum margin for error.
* **Status Flags:** Using `rxdone` and `txdone` signals is essential for interfacing the UART with higher-level system logic.

---

## 🚀 Future Improvements

* **Metastability Protection:** Add a double-flop synchronizer to the RX input.
* **Independence:** Separate the RX and TX baud generators for true asynchronous operation.
* **Configurability:** Support for parity bits and variable baud rates.
* **Robustness:** Implement STOP-bit validation to detect framing errors.

---

## 📬 Contact

* **LinkedIn:** [youssef-w-roshdy](https://www.linkedin.com/in/youssef-w-roshdy/)
* **Email:** youssefwagdy68@gmail.com