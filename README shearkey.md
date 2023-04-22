# Final-Code


README file for Shear Key Dimensions Calculation Code

This code calculates the required length of a square shear key based on the input parameters. The shear key is used to transfer torque between a shaft and a hub. The code takes the following inputs:

- Radious of the shaft (in)
- Yield strength of chosen material (psi)
- Factor of safety
- Width of the square key based on the radius of the axle (in)

The code also includes the following constant values:

- Torque (T) = 38.6*12 lbin
- Axial load (al) = 50.25 ftlbs
- Factor of safety (fos) = 2
- Shear strength (sst) = 0.577 * yield strength (ys)

The code then calculates the required length of the shear key due to shear and due to crush. It then outputs the length required due to crush in millimeters.

To use the code, simply enter the required inputs when prompted. The output value will be displayed in the console.

