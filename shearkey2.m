R = input('Enter the radious of the shaft (in): ');
ys = input('Enteer the yield strenght of chosen material (psi): ');
FS = input('Enter the factor of safety: ');
t = input('Enter the width of the square key based on the Radius of axle (in): ');
T= 38.6*12; %torque lbin;
al= 50.25; %axial load ftlbs
fos=2; %factor of safety
sst=.577*ys; %shear strength
F=T/R; %force at sufrace
lshear=(FS*F)/(sst*t); %lenght required due to shear
lcrush=(FS*F)/(sst*t*2); %length required due to crush
% Calculation of shear key dimensions

% Output values

fprintf('Length (l) = %.2f mm\n', lcrush);
