%��M��
clear
A=[1 2 1 1;
    1 2 3 0;
    2 1 5 0];
b=[10;15;20];
c=[-1 -2 -3 1];
minx=simplex1(A,b,c)
