%调用MATLAB fminunc函数，求无约束多变量函数的最小值
options = optimset('GradObj','on');
x0 = [1,1];
[x,fval] = fminunc(@optifun5,x0,options)
