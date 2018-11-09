% 单纯形法求线性规划LP

clear
A=[2 2 1 0 0;
    1 2 0 1 0;
    4 0 0 0 1];
b=[12;8;16];
c=[-2 -3 0 0 0];
[minx1,minf2,A2,s]=simplex(A,b,c)

clear
A=[1 0 1 0 0;
    0 1 0 1 0;
    1 2 0 0 1];
b=[4;3;8];
c=[-1 -2 0 0 0];
[minx2,minf2,A2,s]=simplex(A,b,c)

clear
A=[1 0 0 1/4 -8 -1 9;
    0 1 0 1/2 -12 -1/2 3;
    0 0 1 0 0 1 0];
b=[0;0;1];
c=[0 0 0 -3/4 20 -1/2 6];
[minx3,minf3,A2,s]=simplex(A,b,c)


clear
A=[1 -2 1 1 0;
    4 -1 -2 0 1;
    -2 0 1 0 0];
b=[11;-3;1];
c=[-3 1 1 0 0];
[minx4,minf4,A2,s]=simplex(A,b,c)






