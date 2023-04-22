% Input parameters
fr = input('Enter the radial load on the berring (Kn): '); %1.15654
fa = input('Enteer the thrust load on the berring (Kn): '); %.22352314
%f = input('Enter the factor of safety: ');
appfact = 1; %application factor (defult 1)
RPM = 200; %revs per min
lr = 10^6; %life rating in hrs
ld = RPM * 10 * 365 * 24 * 60; %number of turns
xd = ld/lr; %
v = 1; %1.2 for outer ring rotates 1 for inner
xo = .02; %x min
b = 1.483; %shape parameter that controls the skewness. For rolling-contact bearings
sigma = 4.459;
aval = 3;
Rd=.99;

%table 11-2
a = [0.014 0.19 1.00 0 0.56 2.30;          0.021 0.21 1.00 0 0.56 2.15;          0.028 0.22 1.00 0 0.56 1.99;          0.042 0.24 1.00 0 0.56 1.85;          0.056 0.26 1.00 0 0.56 1.71;          0.070 0.27 1.00 0 0.56 1.63;          0.084 0.28 1.00 0 0.56 1.55;          0.110 0.30 1.00 0 0.56 1.45;          0.17  0.34 1.00 0 0.56 1.31;          0.28  0.38 1.00 0 0.56 1.15;          0.42  0.42 1.00 0 0.56 1.04;          0.56  0.44 1.00 0 0.56 1.00];
%table 11-1
bearing_table = [10 30 9 0.6 12.5 27 5.07 2.24 4.94 2.12;    12 32 10 0.6 14.5 28 6.89 3.10 7.02 3.05;    15 35 11 0.6 17.5 31 7.80 3.55 8.06 3.65;    17 40 12 0.6 19.5 34 9.56 4.50 9.95 4.75;    20 47 14 1.0 25.0 41 12.7 6.20 13.3 6.55;    25 52 15 1.0 30.0 47 14.0 6.95 14.8 7.65;    30 62 16 1.0 35.0 55 19.5 10.0 20.3 11.0;    35 72 17 1.0 41.0 65 25.5 13.7 27.0 15.0;    40 80 18 1.0 46.0 72 30.7 16.6 31.9 18.6;    45 85 19 1.0 52.0 77 33.2 18.6 35.8 21.2;    50 90 20 1.0 56.0 82 35.1 19.6 37.7 22.8;    55 100 21 1.5 63.0 90 43.6 25.0 46.2 28.5;    60 110 22 1.5 70.0 99 47.5 28.0 55.9 35.5;    65 120 23 1.5 74.0 109 55.9 34.0 63.7 41.5;    70 125 24 1.5 79.0 114 61.8 37.5 68.9 45.5;    75 130 25 1.5 86.0 119 66.3 40.5 71.5 49.0;    80 140 26 2.0 93.0 127 70.2 45.0 80.6 55.0;    85 150 28 2.0 99.0 136 83.2 53.0 90.4 63.0;    90 160 30 2.0 104 146 95.6 62.0 106 73.5;    95 170 32 2.0 110 156 108 69.5 121 85.0];
i=0;
 
% Calculation
c_10_bearing = bearing_table(1, 7);
c_0_bearing = bearing_table(1, 8);

repeat =1;
while repeat == 1

%calculate fa_c0

fa_c0 = fa/c_0_bearing;

[miniumm, position] = min(abs(fa_c0 - a(:,1)));


Fa_v_fr = fa/v/fr;

e = a(position,2);

if Fa_v_fr <=e
    x2_col = 3;
    y2_col = 4;
else
    x2_col = 5;
    y2_col = 6;

end
x = a(position,x2_col);
y = a(position,y2_col);

%calculate F effective
fd=x*v*fr+y*fa;

%calculate C10_calc
C10_calc=appfact*fd*((xd/(xo+(sigma-xo)*(log(1/Rd)^(1/b))))^(1/aval));

if C10_calc < c_10_bearing 
    repeat = 2;
end
i = i+1;
%retrieve new C_10 and c_0 values from table(i+1);
c_10_bearing = bearing_table(i, 7);
c_0_bearing = bearing_table(i, 8);

end
