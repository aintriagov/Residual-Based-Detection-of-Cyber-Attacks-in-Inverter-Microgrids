%The order of the x vector is the following: Also this is the one we see on
%the Simulink File.
% x_vector=[P_i,Q_i,fi_d_i,fi_q_i,gamma_d_i,gamma_q_i,il_d_i,il_q_i,vo_d_i,vo_q_i,io_d_i,io_q_i,alpha_i,wni,Vni];


Cf=50e-6;Lf=1.35e-3;rLf=.1;
Lc=.35e-3;rLc=.03;
wc=31.41;
mp1=9.4e-5;mp2=mp1;mp3=12.5e-5;mp4=mp3;


nq1=1.3e-3;nq2=nq1;nq3=1.5e-3;nq4=nq3;


Kpv1=.1;Kiv1=420;Kpv2=Kpv1;Kiv2=Kiv1;
Kpc1=15;Kic1=20*10^3;Kpc2=Kpc1;Kic2=Kic1;


Kpv3=.05;Kiv3=390;Kpv4=Kpv3;Kiv4=Kiv3;
Kpc3=10.5;Kic3=16*10^3;Kpc4=Kpc3;Kic4=Kic3;


F=.75;

wb=2*pi*50;

A_matrix= [0 0 0 0; 1 0 0 0; 1 0 0 0; 1 0 0 0]; %associated adjacency matrix
g_pinning_gain= [1;0;0;0]; %pinning gain vector
w_ref= 2*pi*50;
v_ref= 1;
c_f_1DG= 30;
c_v_1DG= 30;

%% DG 1 MATRICES BELOW

%% Extracting several terms for x dot 14

%Obtaining a1_14 (term that is multiplied by x1 in x dot 14) (Active Power)

a1_14=0;

for i=1
    for j= 1:4
        a1_14= A_matrix(i,j) + a1_14;
    end
end


a1_14=  -c_f_1DG*mp1*a1_14;

%Obtaining a14_14 (term that is multiplied by x14 in x dot 14)

a14_14=0;

for i=1
    for j= 1:4
        a14_14= A_matrix(i,j) + a14_14;
    end
    a14_14= a14_14 + g_pinning_gain(i);
end

a14_14= - c_f_1DG*a14_14;


%Obtaining a2_15 (term that is multiplied by x2 in x dot 15) Reactive Power

a2_15= 0;

for i= 1
    for j= 1:4
        a2_15= A_matrix(i,j) + a2_15;
    end
end

a2_15= -c_v_1DG*nq1*a2_15;


%Obtaining a10_15 (term that is multiplied by x9 in x dot 15) vodi

a9_15= 0; 

for i= 1
    for j= 1:4
        a9_15= A_matrix(i,j) + a9_15;
    end
    a9_15= a9_15 + g_pinning_gain(i)
end

a9_15= -a9_15*c_v_1DG;


a_x1_DG1= a1_14-mp1*a14_14;

seven_2=-Kpc1*Kpv1*nq1/Lf; seven_3=Kpc1*Kiv1/Lf; seven_5=Kic1/Lf; seven_7= -(rLf/Lf + Kpc1/Lf); seven_9=-(1/Lf + Kpc1*Kpv1/Lf); seven_10=-Kpc1*wb*Cf/Lf; seven_11=Kpc1*F/Lf; seven_15=Kpc1*Kpv1/Lf;
eight_4=Kpc1*Kiv1/Lf; eight_6=Kic1/Lf; eight_8=-(rLf/Lf + Kpc1/Lf); eight_9=Kpc1*wb*Cf/Lf; eight_10= -(Kpc1*Kpv1/Lf + 1/Lf); eight_12=Kpc1*F/Lf;



A_state_matrix_DG1 = [
-wc 0 0 0 0 0 0 0 0 0 0 0 0 0 0;    
0 -wc 0 0 0 0 0 0 0 0 0 0 0 0 0; 
0 -nq1 0 0 0 0 0 0 -1 0 0 0 0 0 1;
0 0 0 0 0 0 0 0 0 -1 0 0 0 0 0;
0 -Kpv1*nq1 Kiv1 0 0 0 -1 0 -Kpv1 -wb*Cf F 0 0 0 Kpv1;
0 0 0 Kiv1 0 0 0 -1 wb*Cf -Kpv1 0 F 0 0 0;
0 seven_2 seven_3 0 seven_5 0 seven_7 -wb seven_9 seven_10 seven_11 0 0 0 seven_15;
0 0 0 eight_4 0 eight_6 wb eight_8 eight_9 eight_10 0 eight_12 0 0 0;
0 0 0 0 0 0 1/Cf 0 0 0 -1/Cf 0 0 0 0;
0 0 0 0 0 0 0 1/Cf 0 0 0 -1/Cf 0 0 0;
0 0 0 0 0 0 0 0 1/Lc 0 -rLc/Lc 0 0 0 0;
0 0 0 0 0 0 0 0 0 1/Lc 0 -rLc/Lc 0 0 0;
-mp1 0 0 0 0 0 0 0 0 0 0 0 0 1 0; 
a_x1_DG1 0 0 0 0 0 0 0 0 0 0 0 0 a14_14 0;
0 a2_15 0 0 0 0 0 0 a9_15 0 0 0 0 0 0;
]


B_input_matrix_DG1 = [
0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0;
0 -1/Lc 0 0 0 0 0 0 0;
0 0 -1/Lc 0 0 0 0 0 0;
-1 0 0 0 0 0 0 0 0;
0 0 0 1 1 1 0 0 0;
0 0 0 0 0 0 1 1 1;
]

C_output_matrix_DG1=[
1 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
0 1 0 0 0 0 0 0 0 0 0 0 0 0 0; 
0 0 1 0 0 0 0 0 0 0 0 0 0 0 0; 
0 0 0 1 0 0 0 0 0 0 0 0 0 0 0;
0 0 0 0 1 0 0 0 0 0 0 0 0 0 0;
0 0 0 0 0 1 0 0 0 0 0 0 0 0 0; 
0 0 0 0 0 0 1 0 0 0 0 0 0 0 0; 
0 0 0 0 0 0 0 1 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 1 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0 1 0 0 0 0 0; 
0 0 0 0 0 0 0 0 0 0 1 0 0 0 0; 
0 0 0 0 0 0 0 0 0 0 0 1 0 0 0;
0 0 0 0 0 0 0 0 0 0 0 0 1 0 0; 
0 0 0 0 0 0 0 0 0 0 0 0 0 1 0; 
0 0 0 0 0 0 0 0 0 0 0 0 0 0 1;
]



%% D matrix DG 1

%x12barDG1=4.264; x13barDG1= 0.2055

x11_bar_DG1= 4.264;
x12_bar_DG1= 0.2055;



i1_DG1= wc*(x11_bar_DG1 + x12_bar_DG1);
i2_DG1= wc*(x11_bar_DG1 + x12_bar_DG1);
i9_DG1= wc*(x11_bar_DG1 + x12_bar_DG1);
i10_DG1= wc*(x11_bar_DG1 + x12_bar_DG1);


main_diagonal_D_DG1=[i1_DG1 i2_DG1 0 0 0 0 0 0 i9_DG1 i10_DG1 0 0 0 0 0];

D_matrix_DG1= diag(main_diagonal_D_DG1)

%%

eigen_A_DG1= eig(A_state_matrix_DG1)
A_D_matrix_DG1= A_state_matrix_DG1 + D_matrix_DG1
eigen_AD_DG1= eig(A_D_matrix_DG1)

%obtaining G

main_diagonal_G_DG1= 1e3*[1.50897 1.50897 1.50897 1.50897 1.50897 1.50897 1.50897 1.50897 1.50897 1.50897 1.50897 1.50897 1.50897 1.50897 1.50897];

G_matrix_DG1= diag(main_diagonal_G_DG1)

L_dot_DG1= A_state_matrix_DG1 + D_matrix_DG1 + G_matrix_DG1 %L' 15x15 dimension

eigen_Ldot_DG1= eig(L_dot_DG1)

eigen_ADL_DG1= eig(A_D_matrix_DG1 - L_dot_DG1) %matrix negative definite eigens are negative

% p= [-1.0e+03 -1.0e+03 -1.0e+03 -1.0e+03 -1.0e+03 -1.0e+03 -1.0e+03 -1.0e+03 -1.0e+03 -1.0e+03 -1.0e+03 -1.0e+03 -1.0e+03 -1.0e+03 -1.0e+03]
% p= [-3880.5 -3880.5 -4022.3 -4022.3 -1771 -1771 -1426 -1426 -31.6 -21.4 -21.4 -1 -30 -109 -96.1]
% % % 
% L_dot_DG1= place(A_state_matrix_DG1' + D_matrix_DG1', C_output_matrix_DG1', p)'




%% DG 2 MATRICES


Cf=50e-6;Lf=1.35e-3;rLf=.1;
Lc=.35e-3;rLc=.03;
wc=31.41;
mp1=9.4e-5;mp2=mp1;mp3=12.5e-5;mp4=mp3;


nq1=1.3e-3;nq2=nq1;nq3=1.5e-3;nq4=nq3;


Kpv1=.1;Kiv1=420;Kpv2=Kpv1;Kiv2=Kiv1;
Kpc1=15;Kic1=20*10^3;Kpc2=Kpc1;Kic2=Kic1;


Kpv3=.05;Kiv3=390;Kpv4=Kpv3;Kiv4=Kiv3;
Kpc3=10.5;Kic3=16*10^3;Kpc4=Kpc3;Kic4=Kic3;


F=.75;

wb=2*pi*50;

A_matrix= [0 0 0 0; 1 0 0 0; 1 0 0 0; 1 0 0 0]; %associated adjacency matrix
g_pinning_gain= [1;0;0;0]; %pinning gain vector
w_ref= 2*pi*50;
v_ref= 1;
c_f_2DG= 30;
c_v_2DG= 30;

m_P_1DG= 9.4*10^-5;
m_P_2DG= 9.4*10^-5;
m_P_3DG= 12.5*10^-5;
m_P_4DG= 12.5*10^-5;
n_Q_1DG= 1.3*10^-3;
n_Q_2DG= 1.3*10^-3; 
n_Q_3DG= 1.5*10^-3; 
n_Q_4DG= 1.5*10^-3; 

m_P_matrix= [m_P_1DG; m_P_2DG; m_P_3DG; m_P_4DG];
n_Q_matrix= [n_Q_1DG; n_Q_2DG; n_Q_3DG; n_Q_4DG];

% vbd2=cos(x1)*vbD2+sin(x1)*vbQ2;vbq2=-sin(x1)*vbD2+cos(x1)*vbQ2;


%% Extracting several terms for x dot 14 

%Obtaining a1_14_2 (term that is multiplied by x1 in x dot 14) (Active Power)

a1_14_2=0;

for i=2
    for j= 1:4
        a1_14_2= A_matrix(i,j) + a1_14_2;
    end
end


a1_14_2=  -c_f_2DG*mp2*a1_14_2;

%Obtaining a14_14 (term that is multiplied by x14 in x dot 14)

a14_14_2=0;

for i=2
    for j= 1:4
        a14_14_2= A_matrix(i,j) + a14_14_2;
    end
    a14_14_2= a14_14_2 + g_pinning_gain(i);
end

a14_14_2= - c_f_2DG*a14_14_2;





        
%% Extracting several terms for x dot 15

%Obtaining a2_15_2 (term that is multiplied by x3 in x dot 15) Reactive Power

a2_15_2= 0;

for i= 2
    for j= 1:4
        a2_15_2= A_matrix(i,j) + a2_15_2;
    end
end

a2_15_2= -c_v_2DG*nq2*a2_15_2;


%Obtaining a9_15_2 (term that is multiplied by x9 in x dot 15) vodi

a9_15_2= 0; 

for i= 2
    for j= 1:4
        a9_15_2= A_matrix(i,j) + a9_15_2;
    end
    a9_15_2= a9_15_2 + g_pinning_gain(i)
end

a9_15_2= -a9_15_2*c_v_2DG;

a_x1_DG2= a1_14_2-mp2*a14_14_2;




%% A matrix calculation

%A has 15 rows 15 columns

% x_vector=[P_i, Q_i, fi_d_i, fi_q_i,gamma_d_i,gamma_q_i, il_d_i, il_q_i, vo_d_i, vo_q_i,io_d_i,io_q_i,alpha_i,wni,Vni];

seven_2=-Kpc1*Kpv1*nq1/Lf; seven_3=Kpc1*Kiv1/Lf; seven_5=Kic1/Lf; seven_7= -(rLf/Lf + Kpc1/Lf); seven_9=-(1/Lf + Kpc1*Kpv1/Lf); seven_10=-Kpc1*wb*Cf/Lf; seven_11=Kpc1*F/Lf; seven_15=Kpc1*Kpv1/Lf;
eight_4=Kpc1*Kiv1/Lf; eight_6=Kic1/Lf; eight_8=-(rLf/Lf + Kpc1/Lf); eight_9=Kpc1*wb*Cf/Lf; eight_10= -(Kpc1*Kpv1/Lf + 1/Lf); eight_12=Kpc1*F/Lf;



A_state_matrix_DG2 = [
-wc 0 0 0 0 0 0 0 0 0 0 0 0 0 0;    
0 -wc 0 0 0 0 0 0 0 0 0 0 0 0 0; 
0 -nq1 0 0 0 0 0 0 -1 0 0 0 0 0 1;
0 0 0 0 0 0 0 0 0 -1 0 0 0 0 0;
0 -Kpv1*nq1 Kiv1 0 0 0 -1 0 -Kpv1 -wb*Cf F 0 0 0 Kpv1;
0 0 0 Kiv1 0 0 0 -1 wb*Cf -Kpv1 0 F 0 0 0;
0 seven_2 seven_3 0 seven_5 0 seven_7 -wb seven_9 seven_10 seven_11 0 0 0 seven_15;
0 0 0 eight_4 0 eight_6 wb eight_8 eight_9 eight_10 0 eight_12 0 0 0;
0 0 0 0 0 0 1/Cf 0 0 0 -1/Cf 0 0 0 0;
0 0 0 0 0 0 0 1/Cf 0 0 0 -1/Cf 0 0 0;
0 0 0 0 0 0 0 0 1/Lc 0 -rLc/Lc 0 0 0 0;
0 0 0 0 0 0 0 0 0 1/Lc 0 -rLc/Lc 0 0 0;
-mp1 0 0 0 0 0 0 0 0 0 0 0 0 1 0; 
a_x1_DG2 0 0 0 0 0 0 0 0 0 0 0 0 a14_14_2 0;
0 a2_15_2 0 0 0 0 0 0 a9_15_2 0 0 0 0 0 0;
]


B_input_matrix_DG2 = [
0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0;
0 -1/Lc 0 0 0 0 0 0 0;
0 0 -1/Lc 0 0 0 0 0 0;
-1 0 0 0 0 0 0 0 0;
0 0 0 1 1 1 0 0 0;
0 0 0 0 0 0 1 1 1;
]

C_output_matrix_DG2=[
1 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
0 1 0 0 0 0 0 0 0 0 0 0 0 0 0; 
0 0 1 0 0 0 0 0 0 0 0 0 0 0 0; 
0 0 0 1 0 0 0 0 0 0 0 0 0 0 0;
0 0 0 0 1 0 0 0 0 0 0 0 0 0 0;
0 0 0 0 0 1 0 0 0 0 0 0 0 0 0; 
0 0 0 0 0 0 1 0 0 0 0 0 0 0 0; 
0 0 0 0 0 0 0 1 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 1 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0 1 0 0 0 0 0; 
0 0 0 0 0 0 0 0 0 0 1 0 0 0 0; 
0 0 0 0 0 0 0 0 0 0 0 1 0 0 0;
0 0 0 0 0 0 0 0 0 0 0 0 1 0 0; 
0 0 0 0 0 0 0 0 0 0 0 0 0 1 0; 
0 0 0 0 0 0 0 0 0 0 0 0 0 0 1;
]


%% D matrix DG 2

%x12barDG2=3.948; x13barDG2= 0.953;

x11_bar_DG2= 3.948;
x12_bar_DG2= 0.953;

i1_DG2= wc*(x11_bar_DG2 + x12_bar_DG2);
i2_DG2= wc*(x11_bar_DG2 + x12_bar_DG2);
i9_DG2= wc*(x11_bar_DG2 + x12_bar_DG2);
i10_DG2= wc*(x11_bar_DG2 + x12_bar_DG2);


main_diagonal_D_DG2=[i1_DG2 i2_DG2 0 0 0 0 0 0 i9_DG2 i10_DG2 0 0 0 0 0];

D_matrix_DG2= diag(main_diagonal_D_DG2)

%%
eigen_A_DG2= eig(A_state_matrix_DG2)
A_D_matrix_DG2= A_state_matrix_DG2 + D_matrix_DG2
eigen_AD_DG2= eig(A_D_matrix_DG2)
 
%obtaining G

main_diagonal_G_DG2= 1e3*[1.50897 1.50897 1.50897 1.50897 1.50897 1.50897 1.50897 1.50897 1.50897 1.50897 1.50897 1.50897 1.50897 1.50897 1.50897];

G_matrix_DG2= diag(main_diagonal_G_DG2)

L_dot_DG2= A_state_matrix_DG2 + D_matrix_DG2 + G_matrix_DG2 %L' 15x15 dimension

eigen_Ldot_DG2= eig(L_dot_DG2)

eigen_ADL_DG2= eig(A_D_matrix_DG2 - L_dot_DG2) %matrix negative definite eigens are negative



%% DG 3 MATRICES



%% Extracting several terms for x dot 14

%Obtaining a1_14_3 (term that is multiplied by x1 in x dot 14) (Active Power)

a1_14_3=0;

for i=3
    for j= 1:4
        a1_14_3= A_matrix(i,j) + a1_14_3;
    end
end


a1_14_3=  -c_f_2DG*mp3*a1_14_3;

%Obtaining a14_14 (term that is multiplied by x14 in x dot 14)

a14_14_3=0;

for i=3
    for j= 1:4
        a14_14_3= A_matrix(i,j) + a14_14_3;
    end
    a14_14_3= a14_14_3 + g_pinning_gain(i);
end

a14_14_3= - c_f_2DG*a14_14_3;

%Obtaining a2_15_3 (term that is multiplied by x2 in x dot 15) Reactive Power

a2_15_3= 0;

for i= 3
    for j= 1:4
        a2_15_3= A_matrix(i,j) + a2_15_3;
    end
end

a2_15_3= -c_v_2DG*nq3*a2_15_3;


%Obtaining a10_15 (term that is multiplied by x10 in x dot 15) vodi

a9_15_3= 0; 

for i= 3
    for j= 1:4
        a9_15_3= A_matrix(i,j) + a9_15_3;
    end
    a9_15_3= a9_15_3 + g_pinning_gain(i)
end

a9_15_3= -a9_15_3*c_v_2DG;

a_x1_DG3= a1_14_3-mp3*a14_14_3;

%% A matrix calculation

%A has 15 rows 15 columns

% x_vector=[P_i, Q_i, fi_d_i, fi_q_i,gamma_d_i,gamma_q_i, il_d_i, il_q_i, vo_d_i, vo_q_i,io_d_i,io_q_i,alpha_i,wni,Vni];

seven_2=-Kpc3*Kpv3*nq3/Lf; seven_3=Kpc3*Kiv3/Lf; seven_5=Kic3/Lf; seven_7= -(rLf/Lf + Kpc3/Lf); seven_9=-(1/Lf + Kpc3*Kpv3/Lf); seven_10=-Kpc3*wb*Cf/Lf; seven_11=Kpc3*F/Lf; seven_15=Kpc3*Kpv3/Lf;
eight_4=Kpc3*Kiv3/Lf; eight_6=Kic3/Lf; eight_8=-(rLf/Lf + Kpc3/Lf); eight_9=Kpc3*wb*Cf/Lf; eight_10= -(Kpc3*Kpv3/Lf + 1/Lf); eight_12=Kpc3*F/Lf;



A_state_matrix_DG3 = [
-wc 0 0 0 0 0 0 0 0 0 0 0 0 0 0;    
0 -wc 0 0 0 0 0 0 0 0 0 0 0 0 0; 
0 -nq3 0 0 0 0 0 0 -1 0 0 0 0 0 1;
0 0 0 0 0 0 0 0 0 -1 0 0 0 0 0;
0 -Kpv3*nq3 Kiv3 0 0 0 -1 0 -Kpv3 -wb*Cf F 0 0 0 Kpv3;
0 0 0 Kiv3 0 0 0 -1 wb*Cf -Kpv3 0 F 0 0 0;
0 seven_2 seven_3 0 seven_5 0 seven_7 -wb seven_9 seven_10 seven_11 0 0 0 seven_15;
0 0 0 eight_4 0 eight_6 wb eight_8 eight_9 eight_10 0 eight_12 0 0 0;
0 0 0 0 0 0 1/Cf 0 0 0 -1/Cf 0 0 0 0;
0 0 0 0 0 0 0 1/Cf 0 0 0 -1/Cf 0 0 0;
0 0 0 0 0 0 0 0 1/Lc 0 -rLc/Lc 0 0 0 0;
0 0 0 0 0 0 0 0 0 1/Lc 0 -rLc/Lc 0 0 0;
-mp3 0 0 0 0 0 0 0 0 0 0 0 0 1 0; 
a_x1_DG3 0 0 0 0 0 0 0 0 0 0 0 0 a14_14_3 0;
0 a2_15_3 0 0 0 0 0 0 a9_15_3 0 0 0 0 0 0;
]

B_input_matrix_DG3 = [
0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0;
0 -1/Lc 0 0 0 0 0 0 0;
0 0 -1/Lc 0 0 0 0 0 0;
-1 0 0 0 0 0 0 0 0;
0 0 0 1 1 1 0 0 0;
0 0 0 0 0 0 1 1 1;
]

C_output_matrix_DG3=[
1 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
0 1 0 0 0 0 0 0 0 0 0 0 0 0 0; 
0 0 1 0 0 0 0 0 0 0 0 0 0 0 0; 
0 0 0 1 0 0 0 0 0 0 0 0 0 0 0;
0 0 0 0 1 0 0 0 0 0 0 0 0 0 0;
0 0 0 0 0 1 0 0 0 0 0 0 0 0 0; 
0 0 0 0 0 0 1 0 0 0 0 0 0 0 0; 
0 0 0 0 0 0 0 1 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 1 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0 1 0 0 0 0 0; 
0 0 0 0 0 0 0 0 0 0 1 0 0 0 0; 
0 0 0 0 0 0 0 0 0 0 0 1 0 0 0;
0 0 0 0 0 0 0 0 0 0 0 0 1 0 0; 
0 0 0 0 0 0 0 0 0 0 0 0 0 1 0; 
0 0 0 0 0 0 0 0 0 0 0 0 0 0 1;
]


%% D matrix DG 3

%x12barDG3=1.328; x13barDG3= 0.1552;

x11_bar_DG3= 1.328;
x12_bar_DG3= 0.1552;

i1_DG3= wc*(x11_bar_DG3 + x12_bar_DG3);
i2_DG3= wc*(x11_bar_DG3 + x12_bar_DG3);
i9_DG3= wc*(x11_bar_DG3 + x12_bar_DG3);
i10_DG3= wc*(x11_bar_DG3 + x12_bar_DG3);


main_diagonal_D_DG3=[i1_DG3 i2_DG3 0 0 0 0 0 0 i9_DG3 i10_DG3 0 0 0 0 0];

D_matrix_DG3= diag(main_diagonal_D_DG3)

%%
eigen_A_DG3= eig(A_state_matrix_DG3)
A_D_matrix_DG3= A_state_matrix_DG3 + D_matrix_DG3
eigen_AD_DG3= eig(A_D_matrix_DG3)

%obtaining G

main_diagonal_G_DG3= 1e3*[1.06453 1.06453 1.06453 1.06453 1.06453 1.06453 1.06453 1.06453 1.06453 1.06453 1.06453 1.06453 1.06453 1.06453 1.06453];

G_matrix_DG3= diag(main_diagonal_G_DG3)

L_dot_DG3= A_state_matrix_DG3 + D_matrix_DG3 + G_matrix_DG3 %L' 15x15 dimension

eigen_Ldot_DG3= eig(L_dot_DG3)

eigen_ADL_DG3= eig(A_D_matrix_DG3 - L_dot_DG3) %matrix negative definite eigens are negative

%% DG 4 


%% Extracting several terms for x dot 14

%Obtaining a1_14_4 (term that is multiplied by x1 in x dot 14) (Active Power)

a1_14_4=0;

for i=4
    for j= 1:4
        a1_14_4= A_matrix(i,j) + a1_14_4;
    end
end


a1_14_4=  -c_f_2DG*mp3*a1_14_4;

%Obtaining a14_14_4 (term that is multiplied by x14 in x dot 14)

a14_14_4=0;

for i=4
    for j= 1:4
        a14_14_4= A_matrix(i,j) + a14_14_4;
    end
    a14_14_4= a14_14_4 + g_pinning_gain(i);
end

a14_14_4= - c_f_2DG*a14_14_4;

a_x1_DG4= a1_14_4-mp4*a14_14_4;

%% Extracting several terms for x dot 15

%Obtaining a2_15_4 (term that is multiplied by x2 in x dot 15) Reactive Power

a2_15_4= 0;

for i= 4
    for j= 1:4
        a2_15_4= A_matrix(i,j) + a2_15_4;
    end
end

a2_15_4= -c_v_2DG*nq3*a2_15_4;


%Obtaining a9_15_4 (term that is multiplied by x9 in x dot 15) vodi

a9_15_4= 0; 

for i= 4
    for j= 1:4
        a9_15_4= A_matrix(i,j) + a9_15_4;
    end
    a9_15_4= a9_15_4 + g_pinning_gain(i)
end

a9_15_4= -a9_15_4*c_v_2DG;



%% A matrix calculation

%A has 15 rows 15 columns

% x_vector=[P_i, Q_i, fi_d_i, fi_q_i,gamma_d_i,gamma_q_i, il_d_i, il_q_i, vo_d_i, vo_q_i,io_d_i,io_q_i,alpha_i,wni,Vni];

seven_2=-Kpc3*Kpv3*nq3/Lf; seven_3=Kpc3*Kiv3/Lf; seven_5=Kic3/Lf; seven_7= -(rLf/Lf + Kpc3/Lf); seven_9=-(1/Lf + Kpc3*Kpv3/Lf); seven_10=-Kpc3*wb*Cf/Lf; seven_11=Kpc3*F/Lf; seven_15=Kpc3*Kpv3/Lf;
eight_4=Kpc3*Kiv3/Lf; eight_6=Kic3/Lf; eight_8=-(rLf/Lf + Kpc3/Lf); eight_9=Kpc3*wb*Cf/Lf; eight_10= -(Kpc3*Kpv3/Lf + 1/Lf); eight_12=Kpc3*F/Lf;



A_state_matrix_DG4 = [
-wc 0 0 0 0 0 0 0 0 0 0 0 0 0 0;    
0 -wc 0 0 0 0 0 0 0 0 0 0 0 0 0; 
0 -nq3 0 0 0 0 0 0 -1 0 0 0 0 0 1;
0 0 0 0 0 0 0 0 0 -1 0 0 0 0 0;
0 -Kpv3*nq3 Kiv3 0 0 0 -1 0 -Kpv3 -wb*Cf F 0 0 0 Kpv3;
0 0 0 Kiv3 0 0 0 -1 wb*Cf -Kpv3 0 F 0 0 0;
0 seven_2 seven_3 0 seven_5 0 seven_7 -wb seven_9 seven_10 seven_11 0 0 0 seven_15;
0 0 0 eight_4 0 eight_6 wb eight_8 eight_9 eight_10 0 eight_12 0 0 0;
0 0 0 0 0 0 1/Cf 0 0 0 -1/Cf 0 0 0 0;
0 0 0 0 0 0 0 1/Cf 0 0 0 -1/Cf 0 0 0;
0 0 0 0 0 0 0 0 1/Lc 0 -rLc/Lc 0 0 0 0;
0 0 0 0 0 0 0 0 0 1/Lc 0 -rLc/Lc 0 0 0;
-mp3 0 0 0 0 0 0 0 0 0 0 0 0 1 0; 
a_x1_DG4 0 0 0 0 0 0 0 0 0 0 0 0 a14_14_4 0;
0 a2_15_4 0 0 0 0 0 0 a9_15_4 0 0 0 0 0 0;
]


B_input_matrix_DG4 = [
0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0;
0 -1/Lc 0 0 0 0 0 0 0;
0 0 -1/Lc 0 0 0 0 0 0;
-1 0 0 0 0 0 0 0 0;
0 0 0 1 1 1 0 0 0;
0 0 0 0 0 0 1 1 1;
]

C_output_matrix_DG4=[
1 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
0 1 0 0 0 0 0 0 0 0 0 0 0 0 0; 
0 0 1 0 0 0 0 0 0 0 0 0 0 0 0; 
0 0 0 1 0 0 0 0 0 0 0 0 0 0 0;
0 0 0 0 1 0 0 0 0 0 0 0 0 0 0;
0 0 0 0 0 1 0 0 0 0 0 0 0 0 0; 
0 0 0 0 0 0 1 0 0 0 0 0 0 0 0; 
0 0 0 0 0 0 0 1 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 1 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0 1 0 0 0 0 0; 
0 0 0 0 0 0 0 0 0 0 1 0 0 0 0; 
0 0 0 0 0 0 0 0 0 0 0 1 0 0 0;
0 0 0 0 0 0 0 0 0 0 0 0 1 0 0; 
0 0 0 0 0 0 0 0 0 0 0 0 0 1 0; 
0 0 0 0 0 0 0 0 0 0 0 0 0 0 1;
]

%% D matrix DG 4

%x12barDG4=1.108; x13barDG4= 0.06113;

x11_bar_DG4= 1.108;
x12_bar_DG4= 0.06113;

i1_DG4= wc*(x11_bar_DG4 + x12_bar_DG4);
i2_DG4= wc*(x11_bar_DG4 + x12_bar_DG4);
i9_DG4= wc*(x11_bar_DG4 + x12_bar_DG4);
i10_DG4= wc*(x11_bar_DG4 + x12_bar_DG4);


main_diagonal_D_DG4=[i1_DG4 i2_DG4 0 0 0 0 0 0 i9_DG4 i10_DG4 0 0 0 0 0];


D_matrix_DG4= diag(main_diagonal_D_DG4)

%%

eigen_A_DG4= eig(A_state_matrix_DG4)
A_D_matrix_DG4= A_state_matrix_DG4 + D_matrix_DG4
eigen_AD_DG4= eig(A_D_matrix_DG4)

%obtaining G

main_diagonal_G_DG4= 1e3*[1.06453 1.06453 1.06453 1.06453 1.06453 1.06453 1.06453 1.06453 1.06453 1.06453 1.06453 1.06453 1.06453 1.06453 1.06453];

G_matrix_DG4= diag(main_diagonal_G_DG4)

L_dot_DG4= A_state_matrix_DG4 + D_matrix_DG4 + G_matrix_DG4 %L' 15x15 dimension

eigen_Ldot_DG4= eig(L_dot_DG4)

eigen_ADL_DG4= eig(A_D_matrix_DG4 - L_dot_DG4) %matrix negative definite eigens are negative


threshold= 1.1