%调用系统函数fgoalattain
clear
goal=[200 -100 -50];
weight=[2040 -100 50];
x0=[60 60];
A=[2 1;-1 -1;-1 0];
b=[200 -100 -50];
lb=zeros(2,1);
[x,fval]=fgoalattain(@optifun12,x0,goal,weight,A,b,[],[],lb,[])
