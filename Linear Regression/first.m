x=1.5;
dt=0.1;
f=(cos(x+dt)-2*cos(x)+cos(x-dt))/(2*dt);
y=2.3;
y0=1;
g=exp(-(y-y0)^2/2);
a=log10(100);
brow=[1,2,3];
bcol=[1;20;3];
m=bcol(2);
s=size(bcol);
bcol=bcol+3*ones(s);
bcol=bcol.^2;
vector=2:1:10;
vector2=2:10;
pts=linspace(1,4,4);
plot(vector,vector2,'m:s');
xlabel('time');
ylabel('amplitude');
title('Amplitude Modulation');
legend('Dont know');
unit_matrix=eye(5);
elem=unit_matrix([4,5],3);
elem2=unit_matrix(1:5,1);
elem3=unit_matrix(:,1);
nr=size(unit_matrix);
r=nr(1);
c=nr(2);
con=[vector,vector2];
con2=[vector;vector2];
%%
ab=7;
y=ab>3 & ab<48;
k=vector<5;
found=vector(k);

if ab<8
    res=1;
else
    res=0;
end
arr(1)=1;
for i=1:5
    arr(i+1)=arr(i)-2;
end
ques=[4,8,12];
ques=ques/4;
