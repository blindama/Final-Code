# Final-Code
README file:

This MATLAB code calculates the bearing life of a rolling-contact bearing using the formula based on ISO281 standard. 

To run the code, you need to provide the input parameters in the command window. The input parameters are as follows:

- fr: the radial load on the bearing in kilonewtons (Kn)
- fa: the thrust load on the bearing in kilonewtons (Kn)
- appfact: the application factor, which is set to 1 by default
- RPM: the revolutions per minute
- lr: the life rating in hours
- xo: the minimum value of x
- b: the shape parameter that controls the skewness. For rolling-contact bearings, b is set to 1.483.
- sigma: the standard deviation of the logarithm of the basic rating life for a bearing. For most bearings, sigma is set to 4.459.
- aval: the percentile reliability or probability of survival for the bearing. For most bearings, aval is set to 3.
- Rd: the reliability factor for the bearing, which is set to 0.99 by default.

The code also includes two tables:

- Table 11-1, which lists the basic bearing dimensions and load ratings for various sizes of rolling-contact bearings.
- Table 11-2, which provides the values of the exponent p for the Weibull distribution of the logarithm of the basic rating life for various reliability levels.

To execute the code, simply run it in the MATLAB command window and input the required parameters when prompted. The output of the code is the calculated bearing life in hours.

Note: This code is based on the ISO281 standard and assumes that the bearing is a rolling-contact bearing. Therefore, it may not be applicable to other types of bearings.
