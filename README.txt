# Fault Diagnosis of Induction Motors


This repository contains the code and documentation for a fault diagnosis system for induction motors using an ACS712 current sensor. The system measures the stator current, collects data using a microcontroller board (Arduino Mega or ESP8266), saves it in a CSV file, and performs data processing and fault analysis using MATLAB.

## Project Description

The fault diagnosis system follows the following steps:

1. Acquisition of current data using the ACS712 sensor:
   - Configure the ACS712 current sensor to measure the stator current of induction motors.
   - Connect the current sensor to the microcontroller board (Arduino Mega or ESP8266) for data collection.

2. Data collection and saving in a CSV file:
   - Establish communication between the microcontroller board and the computer to transfer the collected data.
   - Program the microcontroller board to collect current values at a sampling frequency of 10 kHz or 20 kHz.
   - Save the current data in a CSV file for further analysis.

3. Data processing with MATLAB:
   - Import the current data from the CSV file into MATLAB.
   - Apply a digital filter to remove unwanted noise from the current signal.
   - Utilize fast Fourier transform (FFT) to analyze the frequency components of the signal.

4. Induction motor fault diagnosis:
   - Compare the analysis results with the normal operation of the motor.
   - Identify distinctive characteristics of common faults such as overload, overvoltage, undervoltage, imbalances, etc.
   - Establish detection thresholds or criteria for diagnosing induction motor faults.

## Project Structure

- README.md: The main file containing a comprehensive project description, installation and usage instructions, and references.
- /Arduino: Directory containing the Arduino source code for collecting current data.
- /MATLAB: Directory containing the MATLAB source code for data processing and fault analysis.
- /Datasets: Optional directory for storing recorded current data in CSV format.
- /Documentation: Optional directory for storing any additional documentation, such as wiring diagrams, flowcharts, etc.

## Connection Design

The following diagram illustrates the connection design for the fault diagnosis system prototype:

![Connection Diagram](https://example.com/path/to/connection_diagram.png)

## Installation and Usage

1. Hardware Requirements:
   - ACS712 current sensor.
   - Arduino Mega or ESP8266 board.
   - Computer with MATLAB installed.

2. Hardware Setup:
   - Connect the ACS712 sensor to the stator current circuit of the induction motor following the manufacturer's specifications.
   - Connect the ACS712 sensor output to the appropriate pin of the microcontroller board.
   - Use a 5V supply voltage when using Arduino Mega and a 3.3V supply voltage when using ESP8266.

3. Software Setup:
   - No specific libraries or dependencies are required for the Arduino and MATLAB code.

4. Data Processing and Fault Diagnosis:
   - Upload the Arduino code from the /Arduino directory to the microcontroller board.
   - Run the MATLAB code from the /MATLAB directory to process the collected current data and perform fault diagnosis.

## Experimental Setup

In this project, a synchronous motor and a load were used for testing purposes. The motor and load combination was chosen to simulate real-world operating conditions.
## Future Work

In the future, we plan to expand the fault diagnosis system by incorporating a Raspberry Pi to enable web-based monitoring and visualization of the diagnostic results. Additionally, we aim to utilize artificial intelligence techniques, such as machine learning, to improve the diagnostics by creating a database of default patterns and utilizing it for automated fault detection and classification.

## Contributing

Contributions to this project are welcome. If you have any suggestions, improvements, or bug fixes, please submit a pull request.

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).

## Acknowledgments

Special thanks to the authors of the ACS712 library for Arduino and the MATLAB Signal Processing Toolbox for their invaluable contributions to this project.

---

Feel free to modify this README file according to your specific project details and preferences. If you have any questions or need assistance, please don't hesitate to reach out. Good luck with your fault diagnosis system!

