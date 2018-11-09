%(1)�������㷨�������
%f(x) = 0.12*exp(-0.213*x)+0.52*exp(-0.17*x).*sin(1.23*x)
x = 0:0.25:10;
y = 0.12*exp(-0.213*x)+0.52*exp(-0.17*x).*sin(1.23*x); 
net = newff(x,y,[20,15,10,5]);  %����ǰ�����򴫲�����
y1 = sim(net,x);                %ģ�⶯̬ϵͳ
plot(x,y1,'k:');

net.trainFcn = 'trainlm'; 
net.trainParam.epochs = 500; 
net.trainParam.goal = 1e-6;
net = train(net,x,y);           %ѵ��������
y2 = sim(net,x);                
E = y - y2; 
MSE = mse(E);
hold on;
plot(x,y,'r',x,y2,'-.*')     
legend('untrained','f(x)','trained')


