clear;syms x y
fun=4*x^2+y^2-40*x-12*y+136;
d=1;alpha=1;esp=0.0001; x0=[4 8];x_syms={'x','y'};
[minx1,minf]=hooke(fun,x0',x_syms,d,alpha,esp)     %hooke-Jeeves方法
% % [minx2,minf]=powell(fun,x0,x_syms,esp)             %Powell方法　　　　
% x0={[8 9],[10 9],[8 11]};
% [minx3,minf]=mycomplex(fun,[],x_syms,x0,2,0.000001);      %单纯形法
