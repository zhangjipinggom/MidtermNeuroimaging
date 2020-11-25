function Y = Q2Lorentzian(a, phi, d, f)
% return the time serious shape as [1x1024]
t_n = 1;
N = 1024;
T_n = 1:t_n:N;
amp = exp((-d+1i*2*pi*f)*T_n);
Y = a*exp(phi*1i)*amp;



