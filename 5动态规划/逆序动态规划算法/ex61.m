% clear;%穷举法
% x={[1];[2 3 4];[5 6 7];[8 9];[10]};
% d={[2 4 3];[7 4 6;3 2 4;4 1 5];[1 4;6 3;3 3];[3;4]};
% str={'A';'B1,B2,B3';'C1,C2,C3';'D1,D2';'E'};
% [y,rd2]=road(x,d,str)


% clear;%动态规划法
% x=[1 2 5 8 10;NaN 3 6 9 NaN;NaN 4 7 NaN NaN];
% str={'A';'B1,B2,B3';'C1,C2,C3';'D1,D2';'E'};
% d=[2 4 3 7 4 6 3 2 4 4 1 5 1 4 6 3 3 3 3 4]';
% [y,fval,rd2]=dyprog(x,d,@decisfun1,@subfun1,@trafun1,[],str)




