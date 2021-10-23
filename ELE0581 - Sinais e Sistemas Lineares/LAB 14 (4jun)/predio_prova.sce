predio_b = im2double(imread("C:\Users\Levy\Downloads\predio.jpg"));

altura = length(predio_b(:, 1, 1));
comprimento = length(predio_b(1, :, 1));
cores = length(predio_b(1, 1, :));
p = 0.985;

for i = 1:1:altura
   for j = 1:1:comprimento-1
       predio(i, j+1) = (predio_b(i, j+1) - p*predio_b(i, j))/(1-p);
   end
end

imshow(predio)


