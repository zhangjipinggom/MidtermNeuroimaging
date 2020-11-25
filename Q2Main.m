variance = [2, 5];
L = 1024;
Fs = 1;
f = Fs*(0:L-1)/L;

y_all = [[zeros(1, 1024), zeros(1, 1024)]; [zeros(1, 1024), zeros(1, 1024)]];
for i_fig = 1:2
    E_n = sqrt(variance(i_fig) / 2) * (randn(L, 1) + (1i * randn(L, 1)));
    NAA_t = Q2Lorentzian(10.3, 0, 0.025, 0.8285);
    Cr_t = Q2Lorentzian(4.8, pi, 0.02, 0.8925);
    Cho_t = Q2Lorentzian(3.2, pi/2, 0.015, 0.9053);
    MI_t = Q2Lorentzian(1.5, 0, 0.015, 0.9232);
    Lipid_t = Q2Lorentzian(0.8, pi/6, 0.01, 0.7504);
    MRS_t = NAA_t + Cr_t + Cho_t + MI_t + Lipid_t + E_n';
    MRS_f = fft(MRS_t)/L;
    y_all(i_fig, :) = [MRS_t, MRS_f];
end

grid
for i_fig = 1: 2
    subplot(4, 2, 1+floor(i_fig/2)), plot(abs(y_all(i_fig, 1: 1024)))
    xlabel('Time(t)'), ylabel('|MRS_t|')
    title('absolute value in time domain of MRS signal ' + string(i_fig)')
    subplot(4, 2, 3+floor(i_fig/2)), plot(f, abs(y_all(i_fig, 1025:2048)))
    xlabel('Frequency'), ylabel('|MRS_f|')
    title('absolute value in frenquency domain of MRS signal ' + string(i_fig))
    subplot(4, 2, 5+floor(i_fig/2)), plot(f, real(y_all(i_fig, 1025:2048)))
    xlabel('Frequency'), ylabel('real value')
    title('real value of in frenquency domain of MRS signal ' + string(i_fig))
    subplot(4, 2, 7+floor(i_fig/2)), plot(f, imag(y_all(i_fig, 1025:2048)))
    xlabel('Frequency'), ylabel('imaginary value')
    title('imaginary value in frenquency domain of MRS signal ' + string(i_fig))
end
