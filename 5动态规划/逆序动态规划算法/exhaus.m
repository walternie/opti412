function y=exhaus(x)        %穷举法列举所有的可能
r=size(x,1);       %x一般为元胞
a=1;
for i=1:r
    n(i)=length(x{i});
    a=a*n(i);     %排列的全部组合数
    num(i)=a;
end
y=zeros(a,r);
y(1:n(1),1)=x{1}(1:end)';
for i=2:r
    y(1:num(i),1:i-1)=repmat(y(1:num(i-1),1:i-1),n(i),1);
    for j=1:n(i)
        y((j-1)*num(i-1)+1:j*num(i-1),i)=x{i}(j)*ones(num(i-1),1);
    end
end