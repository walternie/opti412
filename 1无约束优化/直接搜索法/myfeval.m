function y=myfeval(fun,x0,x_syms)     %函数的计算
%%如果x为多组数据，则以元胞形式输入,也可以矩阵的行输入
%%函数为除函数外的所有形式
if nargin==2
    x_syms={'x'};
end
if isempty(fun)
    y=[];
else
  if iscell(x0)
     x0=cell2mat(x0');
  end
  n=size(x0,1);
 [r,c]=size(fun);   %函数的个数
 for i=1:r
    for j=1:c
       if ~ischar(fun(i,j))
           fun(i,j)=char(fun(i,j));
           if findstr(char(fun(i,j)),'@')
               a=findstr(char(fun(i,j)),')');
               fun(i,j)=fun(i,a+1:end);
           end
       end
    end
 end
 for k=1:n
     for i=1:r
         for j=1:c
             if n==1
                y(i,j)=subs(char(fun(i,j)),x_syms,x0(k,:));
             else
                y{k}(i,j)=subs(char(fun(i,j)),x_syms,x0(k,:)); 
             end
         end
     end
 end
end

