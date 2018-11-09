%调用系统intlinprog优化函数解0-1问题
%[x,val] = intlinprog(f,intcon,A,b,Aeq,beq,lb,ub)
clear
f=[7 5 6 8 9];
A=[-3 1 -1 -1 2;
    -1 -3 1 2 -1;
    1 1 -3 -1 -1];
b=[-2;0;1];
ic= [1,2,3,4,5];
lb= zeros(5,1);
ub= ones(5,1);
[x,val]=intlinprog(f,ic,A,b,[],[],lb,ub)
