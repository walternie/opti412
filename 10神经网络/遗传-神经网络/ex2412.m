% (2)�Ŵ�-�������㷨�������
% f(x) = 0.12*exp(-0.213*x)+0.52*exp(-0.17*x).*sin(1.23*x)
Input =10*rand(2000,1);
for i = 1:2000
    output(i,1) = 0.12*exp(-0.213*Input(i)) +0.54*exp(-0.17*Input(i))*sin(1.23*Input(i));
end
maxgen = 50;    %�Ŵ�����
sizepop = 10;   %��Ⱥ����
pc = 0.4;       %�������
pm= 0.2;        %�������
[F1,F2,D1,D2] = GABP(Input,output,maxgen,sizepop,pc,pm);