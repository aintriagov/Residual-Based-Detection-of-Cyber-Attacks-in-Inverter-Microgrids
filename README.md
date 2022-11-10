# Residual-Based-Detection-of-Cyber-Attacks-in-Cyber-Physical-Inverter-Based-Microgrids

Abstract.-

Communication networks and sensing infrastruc-
ture are necessary to realize the distributed cooperative control
of frequency and voltage in cyber-physical microgrids (MGs). At
the same time, such information and communication technologies
expose MGs to potential cyber-attacks of varying nature and
magnitude. In this work, a detailed nonlinear state-space model
of islanded AC MGs with primary droop control and distributed
cooperative secondary control is considered to investigate the im-
pact of different cyber-attacks. Potential attacks to the distributed
secondary control output are introduced to study the impact
on voltage and frequency. Moreover, a nonlinear observer based
framework is developed for detection and mitigation. Finally, the
impact of attacks and the effectiveness of the developed observer
are evaluated with the simulation of an islanded MG test system
with four distributed generators (DGs).


For you to run this experiments these are the steps you have to follow: 

Inside this repository we have the folder Microgrid-4DGs, where it contains the scripts to run the experiments in Simulink and to plot the figures in Matlab environment. 

These files are Script_Microgrid_4DGs.m (run the Simulink files) and Script_Figures_voltage_frequency.m (plots the figures of voltages and frequencies).

Inside the folder Simulink Project we have the folders corresponding to attacks and Mitigation strategy. The L2 norm can be seen in the attacks files and in the mitigation strategy files. 

We also have the file Figures Paper with Tikz where you can check every link of how was written the code to plot those figures inside Tikz environment. 
