clear
options = optimset('Algorithm','sqp');
[x,val]=fmincon(@optifun7,[1 2 3],[],[],[],[],zeros(3,1),[inf;inf;inf],@mycon1,options)