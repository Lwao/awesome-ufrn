n = length(y_ins);
sum1 = 0
for i = 1000:n
    sum1 = sum1+y_ins(i)^2;
end
rms = sqrt(sum1/n);
