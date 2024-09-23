# ⚙️ **8051 Single Digit SSD Interfacing**

<p align="center">
  <img src="https://github.com/gmostofabd/8051-7Segment/blob/2517435ea0f380874d8faed707d9d974918fc997/assets/images/SSD_1D_Counter.png" alt="AT89C51 SSD Circuit" width="70%">
</p>

This repository demonstrates how to interface a **single-digit Seven-Segment Display (SSD)** with the 8051 microcontroller using **assembly language**. A common cathode SSD is utilized in this project, with all necessary files provided, including assembly code, Proteus simulation files, HEX files, and photos from testing.

## 📦 **Project Overview**
This project showcases the basic interfacing of a **Single-Digit Seven-Segment Display (SSD)** with the **AT89C51** microcontroller (from the 8051 family). The SSD is driven directly by the microcontroller, and assembly code is used to display numbers or symbols on the SSD. This is the first step toward understanding SSD interfacing, focusing on controlling a single digit before moving on to multi-digit displays.

### **Key Features:**
- **SSD Control**: Display digits (0-9) or simple characters on the SSD using the 8051 microcontroller.
- **Common Cathode SSD**: This project uses a common cathode SSD, where the cathode is connected to ground, and each segment is controlled individually.
- **Proteus Simulation**: Includes simulation files for SSD interfacing with the 8051 MCU.
- **Test Results**: Screenshots and photos from actual tests provide insights into the project's performance.

## 🔧 **Hardware Components**
- **AT89C51 Microcontroller**: Manages control signals for the Seven-Segment Display.
- **Common Cathode SSD**: A single-digit display used to show numbers or simple characters.
- **Resistors**: Used to limit current to each segment.
- **Power Supply**: Provides the necessary voltage and current for the system.

## 🖥️ **Simulation & Testing**
This project was simulated using **Proteus Design Suite** to verify the SSD's behavior and control before real-world implementation. The repository includes:
- Assembly code for controlling the SSD.
- Proteus simulation file showing SSD operation.
- Screenshots and photos taken during the testing phase.

---

### 🚀 **Steps to Run the Project:**
1. **Clone this repository**:
   ```bash
   git clone https://github.com/yourusername/8051_SSD_Interfacing.git
   ```
2. **Open the Proteus Simulation**: 
   Load the provided simulation file in **Proteus Design Suite** and run it to observe the SSD's behavior.
3. **Compile and Upload the Code**:
   Use **MIDE-51** or any other 8051-compatible IDE to compile the assembly code and generate the HEX file.
4. **Test on Hardware**:
   After programming the microcontroller, assemble the circuit with the SSD and necessary resistors, and power it on to observe real-time results.

---

## 📄 **Included Files:**
- **Assembly Code**: The code to drive the SSD using the 8051 microcontroller.
- **Proteus Simulation Files**: Pre-built simulation to test and visualize the circuit.
- **HEX File**: Ready-to-upload HEX code for the microcontroller.
- **Screenshots & Photos**: Visual proof of successful testing on both Proteus and hardware.

---

## 💡 **Basic Discussion on Seven-Segment Display (SSD)**

A **Seven-Segment Display** (SSD) is a simple electronic device used to display decimal numbers and some characters. It consists of 7 LEDs (segments) arranged in a figure-eight pattern, with an additional eighth segment (dot) sometimes used for indicating decimal points.

In this project, a **Common Cathode** SSD is used, where all cathode terminals of the LEDs are tied together and connected to ground. Each segment can be illuminated by applying a HIGH signal (positive voltage) to the corresponding anode.

### **Seven-Segment Layout**:
<div align="center">

<pre>
      --a--
    |       |
   f|       |b
    |       |
      --g--
    |       |
   e|       |c
    |       |
      --d--
</pre>
</div>

Each segment (labeled a to g) is controlled individually to display numbers or specific characters.

---

## ⚙️ **Connection Diagram for 8051 with SSD**

<div align="center">

<pre>
    8051 MCU                          Single Digit SSD
   __________                       __________________
  |          |                     |                  |
  |  P2.0 ---|-------------------->| a   (Segment a)  |
  |  P2.1 ---|-------------------->| b   (Segment b)  |
  |  P2.2 ---|-------------------->| c   (Segment c)  |
  |  P2.3 ---|-------------------->| d   (Segment d)  |
  |  P2.4 ---|-------------------->| e   (Segment e)  |
  |  P2.5 ---|-------------------->| f   (Segment f)  |
  |  P2.6 ---|-------------------->| g   (Segment g)  |
  |  P2.7 ---|-------------------->| dp  (Decimal Pt) |
  |__________|                     |__________________|
</pre>

</div>

In the above diagram:
- Each segment of the SSD is connected to a pin of the microcontroller's Port 2 (P2.0 to P2.7).
- The common cathode is connected to ground.
- Current-limiting resistors are placed between the microcontroller pins and the SSD segments to protect the LEDs from excessive current.

---

## 📋 **ASCII to 7-Segment Encoding Table**

The table below shows how ASCII characters for digits '0' to '9' are mapped to corresponding segments on a seven-segment display. Each segment is represented by a bit, with 1 meaning the segment is on, and 0 meaning the segment is off.

| ASCII | Character | Segments (abcdefg) | Binary Representation |
|-------|-----------|--------------------|-----------------------|
| 0x30  |     '0'   | a b c d e f        | 0b00111111            |
| 0x31  |     '1'   | b c                | 0b00000110            |
| 0x32  |     '2'   | a b d e g          | 0b01011011            |
| 0x33  |     '3'   | a b c d g          | 0b01001111            |
| 0x34  |     '4'   | b c f g            | 0b01100110            |
| 0x35  |     '5'   | a c d f g          | 0b01101101            |
| 0x36  |     '6'   | a c d e f g        | 0b01111101            |
| 0x37  |     '7'   | a b c              | 0b00000111            |
| 0x38  |     '8'   | a b c d e f g      | 0b01111111            |
| 0x39  |     '9'   | a b c d f g        | 0b01101111            |

---



<p align="center">
  <img src="https://github.com/gmostofabd/8051-7Segment/blob/2517435ea0f380874d8faed707d9d974918fc997/assets/images/SSD_2D_Counter.png" alt="AT89C51 SSD Circuit" width="40%"> <img src="https://github.com/gmostofabd/8051-7Segment/blob/2517435ea0f380874d8faed707d9d974918fc997/assets/images/SSD_2D_Counter1.png" alt="AT89C51 SSD Circuit" width="42%">
</p>






## 🛠️ **BCD to Seven-Segment Decoder**

A **BCD to Seven-Segment Decoder** is a digital logic circuit that takes a binary-coded decimal (BCD) input and converts it into control signals for a seven-segment display. It maps the BCD values (ranging from 0 to 9) to the corresponding segments needed to display the numbers.

### **How It Works**:
- The BCD input is a 4-bit binary number representing decimal digits 0-9.
- The decoder translates this binary input into a 7-bit output, where each bit corresponds to one of the seven segments of the display (a to g).
- The output bits turn the segments ON or OFF to form the desired digit on the SSD.

For example, a BCD input of `0001` (representing the number '1') will activate segments 'b' and 'c' to display the digit '1' on the seven-segment display.

### **Advantages**:
- Simplifies SSD control in larger projects by reducing the number of GPIO pins required.
- Efficient for driving multiple SSDs in multi-digit displays.

In this project, the SSD control is done manually through assembly code, but in more complex projects, a BCD to Seven-Segment Decoder can be integrated to simplify the control logic.

---

In summary, this project provides a foundational understanding of SSD interfacing with microcontrollers, focusing on single-digit control using a common cathode configuration. This knowledge will serve as a basis for more advanced projects involving multi-digit displays and more complex decoding techniques.
