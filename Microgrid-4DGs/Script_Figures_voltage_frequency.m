%VOMAGI NO ATTACK

vomagi_DG1= vomagi.Data(:,1)
vomagi_DG2= vomagi.Data(:,2)
vomagi_DG3= vomagi.Data(:,3)
vomagi_DG4= vomagi.Data(:,4)

subplot(2,1,1)
plot(vomagi.Time, vomagi_DG1, 'blue', 'LineWidth', 3)
hold on
grid on
plot(vomagi.Time, vomagi_DG2, 'red', 'LineWidth', 3)
hold on
plot(vomagi.Time, vomagi_DG3, 'green', 'LineWidth', 3)
hold on
plot(vomagi.Time, vomagi_DG4, 'black' , 'LineWidth', 3)

xlabel('Time (sec)','FontName','Times','FontSize',18)
ylabel('v_{o,mag} (pu)','FontName','Times','FontSize',18)


xlim([0 0.4])
ylim([0 1.5])

legend('DG 1','DG 2','DG 3','DG 4','FontName','Times', 'Location','best')

% title('(a)', 'FontSize', 18);


%FREQUENCY NO ATTACK

frequency_DG1= frequencies.Data(:,1)
frequency_DG2= frequencies.Data(:,2)
frequency_DG3= frequencies.Data(:,3)
frequency_DG4= frequencies.Data(:,4)

subplot(2,1,2)
plot(frequencies.Time, frequency_DG1, 'blue', 'LineWidth', 3)
hold on
grid on
plot(frequencies.Time, frequency_DG2, 'red', 'LineWidth', 3)
hold on
plot(frequencies.Time, frequency_DG3, 'green', 'LineWidth', 3)
hold on
plot(frequencies.Time, frequency_DG4, 'black', 'LineWidth', 3)

xlabel('Time (sec)','FontName','Times','FontSize',18)
ylabel('Frequencies (Hz)','FontName','Times','FontSize',18)


xlim([0 0.4])
ylim([0 60])

legend('DG 1','DG 2','DG 3','DG 4','FontName','Times', 'Location','best')

% title('(b)', 'FontSize', 18);







%VOMAGI FDI 

vomagi_DG1_FDI= vomagi_FDI.Data(:,1)
vomagi_DG2_FDI= vomagi_FDI.Data(:,2)
vomagi_DG3_FDI= vomagi_FDI.Data(:,3)
vomagi_DG4_FDI= vomagi_FDI.Data(:,4)

subplot(2,1,1)
plot(vomagi_FDI.Time, vomagi_DG1_FDI, 'blue', 'LineWidth', 3)
hold on
grid on
plot(vomagi_FDI.Time, vomagi_DG2_FDI, 'red', 'LineWidth', 3)
hold on
plot(vomagi_FDI.Time, vomagi_DG3_FDI, 'green', 'LineWidth', 3)
hold on
plot(vomagi_FDI.Time, vomagi_DG4_FDI, 'black', 'LineWidth', 3)

xlabel('Time (sec)','FontName','Times','FontSize',24)
ylabel('Voltage (p.u.)','FontName','Times','FontSize',24)


%normal


% xlim([0 0.7])
% ylim([0 1.5])

% attacks


% xlim([0.3 0.7])
% ylim([0.7 1.1])

%mitigation

xlim([0.3 0.7])
ylim([0.9 1.1])


legend('DG 1','DG 2','DG 3','DG 4','FontName','Times', 'Location','southeast')

% title('(a)', 'FontSize', 18);


%FREQUENCY FDI

frequency_DG1_FDI= frequencies_FDI.Data(:,1)
frequency_DG2_FDI= frequencies_FDI.Data(:,2)
frequency_DG3_FDI= frequencies_FDI.Data(:,3)
frequency_DG4_FDI= frequencies_FDI.Data(:,4)

subplot(2,1,2)
plot(frequencies_FDI.Time, frequency_DG1_FDI, 'blue', 'LineWidth', 3)
hold on
grid on
plot(frequencies_FDI.Time, frequency_DG2_FDI, 'red', 'LineWidth', 3)
hold on
plot(frequencies_FDI.Time, frequency_DG3_FDI, 'green', 'LineWidth', 3)
hold on
plot(frequencies_FDI.Time, frequency_DG4_FDI, 'black', 'LineWidth', 3)

xlabel('Time (sec)','FontName','Times','FontSize',24)
ylabel('Frequency (Hz)','FontName','Times','FontSize',24)


%normal

% xlim([0 0.7])
% ylim([0 60])

%attacks

% xlim([0.3 0.7])
% ylim([48.5 51])

%mitigation

xlim([0.3 0.7])
ylim([49.5 50.5])

legend('DG 1','DG 2','DG 3','DG 4','FontName','Times', 'Location','southeast')

% title('(b)', 'FontSize', 18);

%% RESIDUAL ERROR L2 FDI ATTACK


L2_DG1_FDI= L2_residual_error_FDI.Data(:,1)
% L2_DG2_FDI= L2_residual_error_FDI.Data(:,2)
% L2_DG3_FDI= L2_residual_error_FDI.Data(:,3)
L2_DG4_FDI= L2_residual_error_FDI.Data(:,2)

subplot(2,1,1)

plot(L2_residual_error_FDI.Time, L2_DG1_FDI, 'blue', 'LineWidth', 3)
% hold on
grid on
% plot(L2_residual_error_FDI.Time, L2_DG2_FDI, 'red', 'LineWidth', 1)
% hold on
% plot(L2_residual_error_FDI.Time, L2_DG3_FDI, 'green', 'LineWidth', 1)
% hold on

xlim([0.3 0.7])
ylim([0 3])

xlabel('Time (sec)','FontName','Times','FontSize',24)
ylabel('l^2 norm','FontName','Times','FontSize',14)

legend('DG 1','FontName','Times', 'Location','northwest')

subplot(2,1,2)
plot(L2_residual_error_FDI.Time, L2_DG4_FDI, 'black', 'LineWidth', 3)
grid on

xlabel('Time (sec)','FontName','Times','FontSize',24)
ylabel('l^2 norm','FontName','Times','FontSize',14)


xlim([0.3 0.7])
ylim([0 3])

legend('DG 4','FontName','Times', 'Location','northwest')

% title('(a)', 'FontSize', 18);


%% JAMMING ATTACK

%VOMAGI JAMMING 

vomagi_DG1_jamming= vomagi_jamming.Data(:,1)
vomagi_DG2_jamming= vomagi_jamming.Data(:,2)
vomagi_DG3_jamming= vomagi_jamming.Data(:,3)
vomagi_DG4_jamming= vomagi_jamming.Data(:,4)

subplot(2,1,1)
plot(vomagi_jamming.Time, vomagi_DG1_jamming, 'blue', 'LineWidth', 3)
hold on
grid on
plot(vomagi_jamming.Time, vomagi_DG2_jamming, 'red', 'LineWidth', 3)
hold on
plot(vomagi_jamming.Time, vomagi_DG3_jamming, 'green', 'LineWidth', 3)
hold on
plot(vomagi_jamming.Time, vomagi_DG4_jamming, 'black', 'LineWidth', 3)

xlabel('Time (sec)','FontName','Times','FontSize',24)
ylabel('Voltage (p.u.)','FontName','Times','FontSize',24)

%mitigation

xlim([0.3 0.7])
ylim([0.9 1.1])


%attacks

% xlim([0.3 0.7])
% ylim([0.4 1.4])

%normal

% xlim([0 0.7])
% ylim([0 1.5])

legend('DG 1','DG 2','DG 3','DG 4','FontName','Times', 'Location','southeast')

% title('(c)', 'FontSize', 18);


%FREQUENCY JAMMING

frequency_DG1_jamming= frequencies_jamming.Data(:,1)
frequency_DG2_jamming= frequencies_jamming.Data(:,2)
frequency_DG3_jamming= frequencies_jamming.Data(:,3)
frequency_DG4_jamming= frequencies_jamming.Data(:,4)

subplot(2,1,2)
plot(frequencies_jamming.Time, frequency_DG1_jamming, 'blue', 'LineWidth', 3)
hold on
grid on
plot(frequencies_jamming.Time, frequency_DG2_jamming, 'red', 'LineWidth', 3)
hold on
plot(frequencies_jamming.Time, frequency_DG3_jamming, 'green', 'LineWidth', 3)
hold on
plot(frequencies_jamming.Time, frequency_DG4_jamming, 'black', 'LineWidth', 3)

xlabel('Time (sec)','FontName','Times','FontSize',24)
ylabel('Frequency (Hz)','FontName','Times','FontSize',24)

%mitigation

xlim([0.3 0.7])
ylim([49.5 50.5])



%attacks

% xlim([0.3 0.7])
% ylim([48.5 51])

%normal 

% xlim([0 0.7])
% ylim([0 60])

legend('DG 1','DG 2','DG 3','DG 4','FontName','Times', 'Location','southeast')

% title('(d)', 'FontSize', 18);

%% RESIDUAL ERROR L2 JAMMING ATTACK

% L1_DG1_jamming= L1_residual_error_jamming.Data(:,1)
% L1_DG4_jamming= L1_residual_error_jamming.Data(:,2)
% 
% subplot(2,1,1)
% plot(L1_residual_error_jamming.Time, L1_DG1_jamming, 'blue', 'LineWidth', 1)
% hold on
% grid on
% plot(L1_residual_error_jamming.Time, L1_DG4_jamming, 'magenta', 'LineWidth', 1)
% 
% xlabel('Time (sec)','FontName','Times','FontSize',18)
% % ylabel('v_{o,mag} (pu)','FontName','Times','FontSize',14)
% 
% 
% xlim([0 0.7])
% ylim([0 2])
% 
% legend('DG 1','DG 4','FontName','Times', 'Location','northwest')
% 
% title('(a)', 'FontSize', 18);
% 

L2_DG1_jamming= L2_residual_error_jamming.Data(:,1)
L2_DG4_jamming= L2_residual_error_jamming.Data(:,2)

% subplot(2,1,2)
plot(L2_residual_error_jamming.Time, L2_DG1_jamming, 'blue', 'LineWidth', 1)
hold on
grid on
plot(L2_residual_error_jamming.Time, L2_DG4_jamming, 'magenta', 'LineWidth', 1)

xlabel('Time (sec)','FontName','Times','FontSize',18)


xlim([0 0.7])
ylim([0 2.5])

legend('DG 1','DG 4','FontName','Times', 'Location','northwest')





%% HYBRID ATTACK

%VOMAGI HYBRID 

vomagi_DG1_hybrid= vomagi_hybrid.Data(:,1)
vomagi_DG2_hybrid= vomagi_hybrid.Data(:,2)
vomagi_DG3_hybrid= vomagi_hybrid.Data(:,3)
vomagi_DG4_hybrid= vomagi_hybrid.Data(:,4)

subplot(2,1,1)
plot(vomagi_hybrid.Time, vomagi_DG1_hybrid, 'blue', 'LineWidth', 1)
hold on
grid on
plot(vomagi_hybrid.Time, vomagi_DG2_hybrid, 'red', 'LineWidth', 1)
hold on
plot(vomagi_hybrid.Time, vomagi_DG3_hybrid, 'black', 'LineWidth', 1)
hold on
plot(vomagi_hybrid.Time, vomagi_DG4_hybrid, 'magenta', 'LineWidth', 1)

xlabel('Time (sec)','FontName','Times','FontSize',18)
ylabel('v_{o,mag} (pu)','FontName','Times','FontSize',18)


xlim([0 0.7])
ylim([0 1.5])

legend('DG 1','DG 2','DG 3','DG 4','FontName','Times', 'Location','best')

title('(a)', 'FontSize', 18);


%FREQUENCY HYBRID

frequency_DG1_hybrid= frequencies_hybrid.Data(:,1)
frequency_DG2_hybrid= frequencies_hybrid.Data(:,2)
frequency_DG3_hybrid= frequencies_hybrid.Data(:,3)
frequency_DG4_hybrid= frequencies_hybrid.Data(:,4)

subplot(2,1,2)
plot(frequencies_hybrid.Time, frequency_DG1_hybrid, 'blue', 'LineWidth', 1)
hold on
grid on
plot(frequencies_hybrid.Time, frequency_DG2_hybrid, 'red', 'LineWidth', 1)
hold on
plot(frequencies_hybrid.Time, frequency_DG3_hybrid, 'black', 'LineWidth', 1)
hold on
plot(frequencies_hybrid.Time, frequency_DG4_hybrid, 'magenta', 'LineWidth', 1)

xlabel('Time (sec)','FontName','Times','FontSize',18)
ylabel('Frequencies (Hz)','FontName','Times','FontSize',18)


xlim([0 0.7])
ylim([0 60])

legend('DG 1','DG 2','DG 3','DG 4','FontName','Times', 'Location','best')

title('(b)', 'FontSize', 18);

%% RESIDUAL ERROR L1 L2 HYBRID ATTACK

% L1_DG1_hybrid= L1_residual_error_hybrid.Data(:,1)
% L1_DG4_hybrid= L1_residual_error_hybrid.Data(:,2)
% 
% subplot(2,1,1)
% plot(L1_residual_error_hybrid.Time, L1_DG1_hybrid, 'blue', 'LineWidth', 1)
% hold on
% grid on
% plot(L1_residual_error_hybrid.Time, L1_DG4_hybrid, 'magenta', 'LineWidth', 1)
% 
% xlabel('Time (sec)','FontName','Times','FontSize',18)
% % ylabel('v_{o,mag} (pu)','FontName','Times','FontSize',14)
% 
% 
% xlim([0 0.7])
% ylim([0 3])
% 
% legend('DG 1','DG 4','FontName','Times', 'Location','northwest')
% 
% title('(a)', 'FontSize', 18);


L2_DG1_hybrid= L2_residual_error_hybrid.Data(:,1)
L2_DG4_hybrid= L2_residual_error_hybrid.Data(:,2)

% subplot(2,1,2)
plot(L2_residual_error_hybrid.Time, L2_DG1_hybrid, 'blue', 'LineWidth', 1)
hold on
grid on
plot(L2_residual_error_hybrid.Time, L2_DG4_hybrid, 'magenta', 'LineWidth', 1)

xlabel('Time (sec)','FontName','Times','FontSize',18)


xlim([0 0.7])
ylim([0 3.5])

legend('DG 1','DG 4','FontName','Times', 'Location','northwest')

% title('(b)', 'FontSize', 18);



%% VOMAGI DOS ATTACK

vomagi_DG1_DOS= vomagi_DOS.Data(:,1)
vomagi_DG2_DOS= vomagi_DOS.Data(:,2)
vomagi_DG3_DOS= vomagi_DOS.Data(:,3)
vomagi_DG4_DOS= vomagi_DOS.Data(:,4)

subplot(2,1,1)
plot(vomagi_DOS.Time, vomagi_DG1_DOS, 'blue', 'LineWidth', 3)
hold on
grid on
plot(vomagi_DOS.Time, vomagi_DG2_DOS, 'red', 'LineWidth', 3)
hold on
plot(vomagi_DOS.Time, vomagi_DG3_DOS, 'green', 'LineWidth', 3)
hold on
plot(vomagi_DOS.Time, vomagi_DG4_DOS, 'black', 'LineWidth', 3)

xlabel('Time (sec)','FontName','Times','FontSize',18)
ylabel('v_{o,mag} (pu)','FontName','Times','FontSize',18)


xlim([0.3 0.7])
ylim([0 1.2])

% xlim([0 0.7])
% ylim([0 1.5])

legend('DG 1','DG 2','DG 3','DG 4','FontName','Times', 'Location','southwest')

% title('(e)', 'FontSize', 18);

%% FREQUENCY DOS ATTACK

frequency_DG1_DOS= frequencies_DOS.Data(:,1)
frequency_DG2_DOS= frequencies_DOS.Data(:,2)
frequency_DG3_DOS= frequencies_DOS.Data(:,3)
frequency_DG4_DOS= frequencies_DOS.Data(:,4)

subplot(2,1,2)
plot(frequencies_DOS.Time, frequency_DG1_DOS, 'blue', 'LineWidth', 3)
hold on
grid on
plot(frequencies_DOS.Time, frequency_DG2_DOS, 'red', 'LineWidth', 3)
hold on
plot(frequencies_DOS.Time, frequency_DG3_DOS, 'green', 'LineWidth', 3)
hold on
plot(frequencies_DOS.Time, frequency_DG4_DOS, 'black', 'LineWidth', 3)

xlabel('Time (sec)','FontName','Times','FontSize',18)
ylabel('Frequencies (Hz)','FontName','Times','FontSize',18)


xlim([0.3 0.7])
ylim([0 60])


% xlim([0 0.7])
% ylim([0 60])

legend('DG 1','DG 2','DG 3','DG 4','FontName','Times', 'Location','southwest')

% title('(f)', 'FontSize', 18);


%% RESIDUAL ERROR L2 DOS ATTACK


L2_DG1_DOS= L2_residual_error_DOS.Data(:,1)
L2_DG4_DOS= L2_residual_error_DOS.Data(:,2)

% subplot(2,1,2)
plot(L2_residual_error_DOS.Time, L2_DG1_DOS, 'blue', 'LineWidth', 3)
hold on
grid on
plot(L2_residual_error_DOS.Time, L2_DG4_DOS, 'magenta', 'LineWidth', 3)

xlabel('Time (sec)','FontName','Helvetica','FontSize',24)
ylabel('l^2 norm','FontName','Helvetica','FontSize',14)


xlim([0.3 0.7])
ylim([0 3500])

legend('DG 1','DG 4','FontName','Times', 'Location','northwest')

% title('(b)', 'FontSize', 18);


%% VOMAGI SINUSOIDAL ATTACK

vomagi_DG1_sinusoidal= vomagi_sinusoidal.Data(:,1)
vomagi_DG2_sinusoidal= vomagi_sinusoidal.Data(:,2)
vomagi_DG3_sinusoidal= vomagi_sinusoidal.Data(:,3)
vomagi_DG4_sinusoidal= vomagi_sinusoidal.Data(:,4)

subplot(2,1,1)
plot(vomagi_sinusoidal.Time, vomagi_DG1_sinusoidal, 'blue', 'LineWidth', 3)
hold on
grid on
plot(vomagi_sinusoidal.Time, vomagi_DG2_sinusoidal, 'red', 'LineWidth', 3)
hold on
plot(vomagi_sinusoidal.Time, vomagi_DG3_sinusoidal, 'green', 'LineWidth', 3)
hold on
plot(vomagi_sinusoidal.Time, vomagi_DG4_sinusoidal, 'black', 'LineWidth', 3)

xlabel('Time (sec)','FontName','Times','FontSize',24)
ylabel('Voltage (p.u.)','FontName','Times','FontSize',24)


%attacks

% xlim([0.3 0.7])
% ylim([0.85 1.15])

%normal

% xlim([0 0.7])
% ylim([0 1.5])

%mitigation

xlim([0.3 0.7])
ylim([0.8 1.2])

legend('DG 1','DG 2','DG 3','DG 4','FontName','Times', 'Location','southeast')

% title('(g)', 'FontSize', 18);


%% FREQUENCY SINUSOIDAL ATTACK

frequency_DG1_sinusoidal= frequencies_sinusoidal.Data(:,1)
frequency_DG2_sinusoidal= frequencies_sinusoidal.Data(:,2)
frequency_DG3_sinusoidal= frequencies_sinusoidal.Data(:,3)
frequency_DG4_sinusoidal= frequencies_sinusoidal.Data(:,4)

subplot(2,1,2)
plot(frequencies_sinusoidal.Time, frequency_DG1_sinusoidal, 'blue', 'LineWidth', 3)
hold on
grid on
plot(frequencies_sinusoidal.Time, frequency_DG2_sinusoidal, 'red', 'LineWidth', 3)
hold on
plot(frequencies_sinusoidal.Time, frequency_DG3_sinusoidal, 'green', 'LineWidth', 3)
hold on
plot(frequencies_sinusoidal.Time, frequency_DG4_sinusoidal, 'black', 'LineWidth', 3)

xlabel('Time (sec)','FontName','Times','FontSize',24)
ylabel('Frequency (Hz)','FontName','Times','FontSize',24)


%attack

% xlim([0.3 0.7])
% ylim([48.5 51.5])

%normal

% xlim([0 0.7])
% ylim([0 60])

%mitigation

xlim([0.3 0.7])
ylim([49.5 50.5])

legend('DG 1','DG 2','DG 3','DG 4','FontName','Times', 'Location','southeast')

% title('(h)', 'FontSize', 18);


%% RESIDUAL ERROR L2 SINUSOIDAL ATTACK
 

L2_DG1_sinusoidal= L2_residual_error_sinusoidal.Data(:,1)
L2_DG4_sinusoidal= L2_residual_error_sinusoidal.Data(:,2)

% subplot(2,1,2)
plot(L2_residual_error_sinusoidal.Time, L2_DG1_sinusoidal, 'blue', 'LineWidth', 3)
hold on
grid on
plot(L2_residual_error_sinusoidal.Time, L2_DG4_sinusoidal, 'magenta', 'LineWidth', 3)

xlabel('Time (sec)','FontName','Times','FontSize',24)
ylabel('l^2 norm','FontName','Helvetica','FontSize',14)

xlim([0.3 0.7])
ylim([0 15])

legend('DG 1','DG 4','FontName','Times', 'Location','northwest')

% title('(c)', 'FontSize', 18);
