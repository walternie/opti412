function y=myjacobian(fun,x_syms)   %求复函数的导数
if nargin==1
    x_syms='x';
end
str=find(char(x_syms)==',');
if ~isempty(str)
    xsyms=findletter(x_syms,2);
else
   xsyms=x_syms; 
end
if ~isempty(fun)
  r=size(fun,1);
  n=length(xsyms);
  for i=1:r
     for j=1:n
        if iscell(fun)||ischar(fun)
            if iscell(xsyms)
                y(i,j)=jacobian(sym(fun(i,:)),xsyms{j});
            else
                y(i,j)=jacobian(sym(fun(i,:)),xsyms(j));
            end
        else
            if iscell(xsyms)
                y(i,j)=jacobian((fun(i,:)),xsyms{j});
            else
                y(i,j)=jacobian((fun(i,:)),xsyms(j));
            end
        end
     end
  end
else
    y=[];
end