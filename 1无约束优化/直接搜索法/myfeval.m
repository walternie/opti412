function y=myfeval(fun,x0,x_syms)     %�����ļ���
%%���xΪ�������ݣ�����Ԫ����ʽ����,Ҳ���Ծ����������
%%����Ϊ���������������ʽ
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
 [r,c]=size(fun);   %�����ĸ���
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

