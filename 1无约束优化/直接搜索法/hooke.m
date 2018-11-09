function [minx,minf]=hooke(fun,x0,x_syms,d,alpha,esp)  %hooke直接搜索法，x0为初始值，以行输入,d为步长
if nargin==5
    esp=1e-8;
elseif nargin==4
    alpha=1.0;
    esp=1e-8;
elseif nargin==3
    d=1;
    alpha=1.0;
    esp=1e-8;
end
n=size(x0,1);
x(1,:)=x0;
y(1,:)=x(1,:);
h=eye(n);
k=1;
while k<2000
  j=1;
  while 1
     a=y(j,:)+d*h(j,:);
     fa=myfeval(fun,a,x_syms);
     if fa<myfeval(fun,y(j,:),x_syms)
        y(j+1,:)=a;
     else
       a=y(j,:)-d*h(j,:); 
       fa=myfeval(fun,a,x_syms);
       if fa<myfeval(fun,y(j,:),x_syms)
          y(j+1,:)=a;
       else
          y(j+1,:)=y(j,:);  
       end
     end
     if j<n
         j=j+1;
     else
         break;
     end
  end
  if myfeval(fun,y(n+1,:),x_syms)<myfeval(fun,x(k,:),x_syms)
       x(k+1,:)=y(n+1,:);
       y(1,:)=x(k+1,:)+alpha*(x(k+1,:)-x(k,:));
       k=k+1;
  else
       if d<=esp
          minx=x(k,:);
          minf=myfeval(fun,minx,x_syms);
          break;
       else
          y(1,:)=x(k,:);
          x(k+1,:)=x(k,:);
          d=d/2;
          k=k+1;
        end
  end
end
             
            
        
    
  
