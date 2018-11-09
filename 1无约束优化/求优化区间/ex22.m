% clear
% phi=sym('exp(-x)*sin(x^2)');
% x0=[0,5];
% out=myfzeros(phi,x0)


% clear;
% syms x y z;
% x_syms={'x','y','z'};
% phi=3*(x^3+y^3-z^3)+(z-x-y);
% out=mymultifun(phi,[],[],x_syms,'u_L')


clear;
syms x y z a b;
phi=7*x-6*y+4*z+a*(x^2+2*y^2+3*z^2-1)+b*(5*x+5*y-3*z-6);
x_syms={{'x','y','z'},{'a','b'}};
out=mymultifun(phi,[],[],x_syms,'u_c')





