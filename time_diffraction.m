close all;
clear;
clc;

Amp = 0.8;
Phi = 0;
ss = 800e-15;
t = -1000e-15:1e-15:999e-15;
alpha = 1e15;
beta = 1e13;

Sp = Amp.*exp(1j*Phi);

fs1 = 1./((1+exp(-alpha*(t-ss/2))).*(1+exp(beta*(t-ss/2))));
fs2 = 1./((1+exp(-alpha*(t+ss/2))).*(1+exp(beta*(t+ss/2))));

rt = Sp.*fs1 +Sp.*fs2;
Rw  = abs(fftshift(fft(Sp.*fs1 +Sp.*fs2)));

figure(1);
subplot(1,2,1)
plot(rt)
subplot(1,2,2)
plot(Rw)


