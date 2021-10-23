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
v = y(4:p);
M = [];
//for i = 1:p-2
//    M(i,:) = [u(1+i),u(i),-y(1+i),-y(i)];
//end
for i = 1:p-3
    M(i,:) = [u(i+2)-y(i+1),u(i+1)-y(i),-y(i+2),-y(i+1)];
end
c = inv(M'*M)*M'*v;

