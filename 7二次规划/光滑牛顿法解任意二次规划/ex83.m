%光滑牛顿法解二次规划

clear
c=[-2 0 0 0]';
H=[2 -2 0 0;-2 2 0 0;0 0 0 0;0 0 0 0];
Ae=[1 1 1 0;1 5 0 1];
be=[3 6]';
Ai=eye(4);
bi=[0 0 0 0];
[xmin,minf,mu,lm]=newquad(H,c,Ae,be,Ai,bi)
