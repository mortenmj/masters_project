J1=0.4; J2=1.0; c1=11; c2=5; d1=0.2; d2=1.0;
A = [0 0 1 0; 
     0 0 0 1;
     -c1/J1 c1/J1 -d1/J1 d1/J1; 
     c1/J2 -(c1+c2)/J2 d1/J2 -(d1+d2)/J2];
B = zeros(size(A,1),1);
C = [0 0 1 0];

sys  = ss(A, B, C, 0);
init = [0 1 0 0];

initial(sys, init);