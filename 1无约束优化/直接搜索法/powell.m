function [minx,minf]=powell(fun,x0,x_syms,esp)   %powell算法求极值
if nargin==3
    esp=1e-6;
end
num=length(x0);
d=eye(num);   %搜索方向
for k=1:2000
    x1=x0;xk=x0;
    for i=1:num
       y=mysearch(fun,x0,x_syms,d(i,:),'equ');
       x1=x1+y*d(i,:);
       xk=[xk;x1];
    end
    err=norm(xk(end,:)-x0);  
    if err<esp
        minx=xk(end,:);    %最终值
        minf=myfeval(fun,minx,x_syms);
        break;
    else
        y=myfeval(fun,xk,x_syms);
        for j=1:size(xk,1)-1
           a(j)=y(j)-y(j+1);
        end
        delta=max(a);
        f1=y(1);
        f2=y(end);
        f3=myfeval(fun,2*xk(end,:)-x0,x_syms);
        if 2*delta<(f1-2*f2+f3)
           x0=xk(end,:);
        else
          d(num,:)=xk(end,:)-x0;
          y1=mysearch(fun,xk(end,:),x_syms,d(num,:),'equ');
          x0=xk(end,:)+y1*d(num,1);
        end
    end
end

    
        
    
