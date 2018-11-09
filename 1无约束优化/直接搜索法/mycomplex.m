function [minx,minf]=mycomplex(fun,myphi,x_syms,x0,type,esp)   %复形法求最优值,phi为约束函数,x0为初始点，以元胞形式输入
%%第一种方法输入点为2*varnum个点，第二种方法为n+1个点,phi约束函数
if nargin==5
    esp=1e-6;
end
switch type
    case 1
         y=myfeval(fun,x0,x_syms);
         if isempty(myphi)
             flag=0;
         else
             flag=1;
         end
         while 1
            alpha=1.3;
            [a,b]=max(y);
            xl=x0{b};  %最坏点
            b1=redu(x0,b,'c');
            a1=mean(cell2mat(b1')); 
            if alpha*norm(a1-xl)<=1e-8  %停止条件一
                [minf,b]=min(y);
                minx=x0{b}; 
                break;
            end
            while 1
               x_alpha=a1+alpha*(a1-xl);     %求新的点
               if flag==1
                  y1=myphi(x_alpha);   %约束函数要根据实际编写函数形式
                  if y1==1
                     break
                  else
                     alpha=alpha/2;
                  end
               else
                  break;
               end
            end
            ynew=myfeval(fun,x_alpha,x_syms);
            if ynew<a
               x0{b}=x_alpha;
               y(b)=ynew;
            elseif alpha>0.01 
               while 1
                   while 1
                      alpha=alpha/2;
                      if alpha<=0.01
                         x0=redu(x0,b,'c');
                         break;
                      else
                         x_alpha=a1+alpha*(a1-xl);
                         if flag==1
                             y1=myphi(x_alpha);   
                             if y1==1
                                break
                             end
                         else
                             break;
                         end
                      end
                   end
                   y2=myfeval(fun,x_alpha,x_syms);
                   if y2<a
                      x0{b}=x_alpha;
                      y(b)=y2;
                      break
                   end 
              end
            else
               x0=redu(x0,b,'c');   
            end
            total=0;
            n1=size(x0,2);
            for i=1:n1
               total=total+(myfeval(fun,x0{i},x_syms)-a)^2;
            end
            if total/n1<esp
              [minf,b]=min(y);
              minx=x0{b};  
              break;
            end
         end
    case 2
      n=size(x0,2);
      y=myfeval(fun,x0,x_syms);
      k=1;
      while k<2000 
         lamda=0.75;mu=2;
         [a1,b1]=max(y);
         xh=x0{b1};  %最坏点
         fh=a1;
         b=redu(x0,b1,'c');
         xc=mean(cell2mat(b'));   %剩余点的重心
         [a2,b2]=min(y);   
         xl=x0{b2};       %最好点
         xr=2*xc-xh;      %反射点
         fr=myfeval(fun,xr,x_syms);
         if fr>=fh
            xs=xh+lamda*(xr-xh);
            fs=myfeval(fun,xs,x_syms);
         else
            xe=xh+mu*(xr-xh);
            fe=myfeval(fun,xe,x_syms);
            if fe<=fr
               xs=xe;
               fs=fe;
            else
               xs=xr;
               fs=fr;
            end
         end
         if  fs<fh
            x0{b1}=xs;
            y(b1)=fs;
         else
            total=0;
            for i=1:n
                total=total+(myfeval(fun,x0{i},x_syms)-a1)^2;
            end
            if total/n<esp
               minx=x0{b2};
               minf=a2;
               break
            else
               for i=1:n
                  x0{i}=(x0{i}+xl)/2;
               end
               y=myfeval(fun,x0,x_syms);
            end
         end
         k=k+1;
      end
end



       
           
       
           
   
   



   
      










       




