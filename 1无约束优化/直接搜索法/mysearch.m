function [y,x]=mysearch(fun,x0,x_syms,d0,type)    %����ȷ�����󲽳�,d0Ϊ����
if isempty(d0)
    z=myjacobian(fun,x_syms);
    g=subs(z,x_syms,x0);
    d0=-g;
end
switch type
    case 'd'   %ֱ�ӷ�
        z=myjacobian(fun,x_syms);
        a=0;b=inf;lamda=1;y=lamda;m=0;c1=0.1;c2=0.5;
        f=myfeavl(fun,x0,x_syms);
        g=myfeval(z,x0,x_syms);
        t=g*d0';
        while 1
           if m>20
               break
           end
           x1=x0+lamda*d0;
           f1=myfeval(fun,x1,x_syms);
           g1=myfeval(z,x1,x_syms);
           t1=g1*d0';
           a1=f-f1;
           a2=-c1*lamda*t;
           a3=c2*t;
           if (a1>=a2)&&(t1>=a3)
               y=lamda;
               x=x1;
               break;
           elseif (a1>=a2)&&t1<a3
               a=lamda;
               lamda=min(2*lamda,(lamda+b)/2);
           elseif a1<a2
               b=lamda;
               lamda=(lamda+a)/2;
           end
           m=m+1;
        end
    case 'a'   %Armijo����
        z=myjacobian(fun,x_syms);
        m=0;maxm=20;beta=0.5;sigma=0.2;
        y1=0;
        while m<=maxm
           x1=myfeval(fun,x0+beta^m*d0,x_syms);
           x2=myfeval(fun,x0,x_syms)+sigma*beta^m*myfeval(z,x0,x_syms)*d0';
           if x1<=x2
               y1=m;  
               break;
           end
           m=m+1;
        end
        y=beta^y1;
        x=x0+y*d0;
    case 'equ'     %�ⷽ���󲽳�
        syms al x
        x1=x0+al*d0;
        phi=myfeval(fun,x1,x_syms);
        phi=eval(subs(phi,al,'x'));
        ds=diff(phi);
        x2=eval(solve(ds));   %�ⷽ���󲽳�
        for i=1:length(x2)
           if isreal(x2(i))
              y1=mymin(phi,x2(i),'min');
                if y1==1
                  y=x2(i);
                  break
                end 
           end
        end
        if exist('y','var')==1
            x=x0+y*d0;
        else
            error('������ʵ����');
        end
    case 's'    %һά������
        syms al x
        x1=x0+al*d0;
        phi=(subs(fun,x_syms,x1));
        phi=eval(subs(phi,al,'x'));
        y=goldcut(phi,1);
        x=x0+y*d0;  
end



       
        