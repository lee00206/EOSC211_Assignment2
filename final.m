x1=[1 8 -7 2 -9 -3];

count=1;
for i=1:length(x1)-1
    if x1(i)>x1(i+1)
        ix(count)=i;
        count=count+1;
    end
end
x2=x1(ix)
