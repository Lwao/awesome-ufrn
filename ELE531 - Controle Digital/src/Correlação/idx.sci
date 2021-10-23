td = ident.time;  // ident
tc = orig.time; // original
c = length(tc);
d = length(td);
idx_c = [];
idx_d = [];
cnt=0;
for i = 1:c
    for j = 1:d
        if(tc(i)==td(j)) then
            idx_c = [idx_c i];
            idx_d = [idx_d j];   
        end    
    end
end

yc = orig.values;
yd = ident.values;
x = [];
y = [];

for i = 1:length(idx_d)
    x(i) = yd(idx_d(i));
end
for i = 1:length(idx_c)
    y(i) = yc(1,idx_c(i));
end
