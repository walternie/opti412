function v=subfun1(k,x,u,d)
xz=[x==1 & u==2,x==1 & u==3,x==1 & u==4,...
    x==2 & u==5,x==2 & u==6,x==2 & u==7,...
    x==3 & u==5,x==3 & u==6,x==3 & u==7,...
    x==4 & u==5,x==4 & u==6,x==4 & u==7,...
    x==5 & u==8,x==5 & u==9,...
    x==6 & u==8,x==6 & u==9,...
    x==7 & u==8,x==7 & u==9,...
    x==8 & u==10,...
    x==9 & u==10];
v=xz*d;