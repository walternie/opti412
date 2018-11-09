function [x,lamda,minf]=myquad(H,c,A,b)  %二次规划的拉格朗日乘子法
IH=inv(H);
AHA=A/H*A';
IAHA=inv(AHA);
AIH=A/H;
G=IH-AIH'/AHA*AIH;
B=AHA\AIH;
C=-IAHA;
x=B'*b-G*c;
lamda=B*c-C*b;
minf=0.5*x'*H*x+c'*x;



