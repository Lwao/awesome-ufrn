/*
c -> coefficients vector
v -> output values vector
M ->  identification matrix
*/

t = A.time;   //Nx1
y = A.values; //Nx1
u = V.values; //Nx1
p = length(y); // measures quantity
//y = y;
//u = x;
v = y(3:p);
M = [];
//for i = 1:p-2
//    M(i,:) = [u(1+i),u(i),-y(1+i),-y(i)];
//end
for i = 1:p-2
    M(i,:) = [u(i+1),u(i),-y(i+1),-y(i)];
end
c = inv(M'*M)*M'*v;
