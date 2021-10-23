/*
z_lineX:
    impedâncias de linha de seq.0+-, em que cada elemento Zij, representa a impedância da barra i para a barra j.
    
z_busX:
    impedâncias equivalentes de seq.0+-, em que cada elemento Zij, representa a impedância equivalente da barra i para a barra j.
    
z_f:
    impedância de falta.

trans_X:
    impedâncias dos transformadores de seq.+-.

shunt_X:
    impedâncias shunts à barra.

trans_X:
    impedâncias dos transformadores de seq.+-.  
    
V:
    tensões pré-falta nas barras
 
Ib1, Ib2, Vb1, Vb2, Sb:
    valores de base

ICC_3f,ICC_2f,ICC_1f:
    correntes de curto-circuito nas barras para curto trifásico/bifásico/monofásico em cada uma das barras
    
    LINHA 1 - comp. de seq.+, LINHA 2 - comp. seq.-, LINHA 3 - comp. seq.0
    COLUNA 1 - falta na barra 1, PROFUNDIDADE 2 - falta na barra 2, ...

VCC_3f, VCC_2f, VCC_1f:
    tensões nas barras para curto trifásico/bifásico/monofásico em cada uma das barras
    
    LINHA 1 - comp. de seq.+, LINHA 2 - comp. seq.-, LINHA 3 - comp. seq.0
    COLUNA 1 - tensão na barra 1, COLUNA 2 - tensão na barra 2, ...
    PROFUNDIDADE 1 - falta na barra 1, PROFUNDIDADE 2 - falta na barra 2, ...

I1_3f,I2_3f,I0_3f,I1_2f,I2_2f,I0_2f,I1_1f,I2_1f,I0_1f:
    correntes de linha de pós-falta trifásica,bifásica,monofásica nas seq.+-0
    
    corrente Ijk que parte da BARRA/LINHA j e chega na BARRA/COLUNA k
    PROFUNDIDADE 1 - falta na barra 1, PROFUNDIDADE 2 - falta na barra 2, ...
    
*/

funcprot(0);
function [zb1,zb2,zb0] = line2bus(zl1,zl2,zl0,s1,s2,s0)
    n = length(zl1(1,:));
    for i = 1:n
        for j = 1:n
           if(i~=j)
                yb1(i,j)=-1/zl1(i,j);
                yb2(i,j)=-1/zl2(i,j);
                yb0(i,j)=-1/zl0(i,j);
           end
        end
    end
    for i = 1:n
        yb1(i,i)= 0;
        yb2(i,i)= 0;
        yb0(i,i)= 0;
    end
    for i = 1:n
        yb1(i,i)= -sum(yb1(i,:))+s1(i);
        yb2(i,i)= -sum(yb2(i,:))+s2(i);
        yb0(i,i)= -sum(yb0(i,:))+s0(i);
    end
    zb1 = inv(yb1);
    zb2 = inv(yb2);
    zb0 = inv(yb0);   
endfunction
function [ICC_3f,ICC_2f,ICC_1f] = falt_current(V,zb1,zb2,zb0,zf,n)
    for i = 1:n
        ICC_3f(1,i) = V(i)/(zb1(i,i)+zf); 
        ICC_3f(2,i) = 0;
        ICC_3f(3,i) = 0;
    end
    for i = 1:n
        ICC_2f(1,i) = V(i)/(zb1(i,i)+zb2(i,i)+z_f); 
        ICC_2f(2,i) = -ICC_2f(1,i);
        ICC_2f(3,i) = 0;
    end
    for i = 1:n
        ICC_1f(1,i) = V(i)/(zb1(i,i)+zb2(i,i)+zb0(i,i)+z_f); 
        ICC_1f(2,i) = ICC_1f(1,i);
        ICC_1f(3,i) = ICC_1f(1,i);
    end
endfunction

function [VCC_3f, VCC_2f, VCC_1f] = voltage(V,zb1,zb2,zb0,ICC_3f,ICC_2f,ICC_1f)
    n = length(V);
    for j = 1:n
        for i = 1:n
            VCC_3f(1,i,j) = V(i)-zb1(i,j)*ICC_3f(1,j); 
            VCC_3f(2,i,j) = -zb2(i,j)*ICC_3f(2,j);
            VCC_3f(3,i,j) = -zb0(i,j)*ICC_3f(3,j);
        end
    end
    for j = 1:n
        for i = 1:n
            VCC_2f(1,i,j) = V(i)-zb1(i,j)*ICC_2f(1,j); 
            VCC_2f(2,i,j) = -zb2(i,j)*ICC_2f(2,j);
            VCC_2f(3,i,j) = -zb0(i,j)*ICC_2f(3,j);
        end
    end
    for j = 1:n
        for i = 1:n
            VCC_1f(1,i,j) = V(i)-zb1(i,j)*ICC_1f(1,j); 
            VCC_1f(2,i,j) = -zb2(i,j)*ICC_1f(2,j);
            VCC_1f(3,i,j) = -zb0(i,j)*ICC_1f(3,j);
        end
    end
endfunction

function [I1_3f,I2_3f,I0_3f,I1_2f,I2_2f,I0_2f,I1_1f,I2_1f,I0_1f] = line_current(VCC_3f,VCC_2f,VCC_1f,Z1,Z2,Z0)
    //I-jk -> current from j to k
    // linha 1 - comp. seq. +, linha 2 - comp. seq. -, linha 3 - comp. seq. 0
    // coluna 1 - tensão na barra 1, ...
    // profundidade 1 - falta na barra 1, ...
    n = length(VCC_3f(1,1,:));
    for i = 1:n //falta na barra
        for j = 1:n //de
            for k = 1:n //para
                I1_3f(j,k,i) = (VCC_3f(1,j,i)-VCC_3f(1,k,i))/Z1(j,k);    
                I2_3f(j,k,i) = (VCC_3f(2,j,i)-VCC_3f(2,k,i))/Z2(j,k);
                I0_3f(j,k,i) = (VCC_3f(3,j,i)-VCC_3f(3,k,i))/Z0(j,k);
            end
        end
    end
    for i = 1:n //falta na barra
        for j = 1:n //de
            for k = 1:n //para
                I1_2f(j,k,i) = (VCC_2f(1,j,i)-VCC_2f(1,k,i))/Z1(j,k);    
                I2_2f(j,k,i) = (VCC_2f(2,j,i)-VCC_2f(2,k,i))/Z2(j,k);
                I0_2f(j,k,i) = (VCC_2f(3,j,i)-VCC_2f(3,k,i))/Z0(j,k);
            end
        end
    end
    for i = 1:n //falta na barra
        for j = 1:n //de
            for k = 1:n //para
                I1_1f(j,k,i) = (VCC_1f(1,j,i)-VCC_1f(1,k,i))/Z1(j,k);    
                I2_1f(j,k,i) = (VCC_1f(2,j,i)-VCC_1f(2,k,i))/Z2(j,k);
                I0_1f(j,k,i) = (VCC_1f(3,j,i)-VCC_1f(3,k,i))/Z0(j,k);
            end
        end
    end  
endfunction


           


// QUESTÃO 1

z_line12 = [%inf, (0.3406+0.826*%i), %inf, (0.2128+0.516*%i);
            (0.3406+0.826*%i), %inf, (0.2923+0.247*%i), %inf;
            %inf, (0.2923+0.247*%i), %inf, (0.1996+0.484*%i);
            (0.2128+0.516*%i), %inf, (0.1996+0.484*%i), %inf];
            
z_line0 = [%inf, (0.6591+3.069*%i), %inf, (0.4118+1.918*%i);
           (0.6591+3.069*%i), %inf, (0.3669+0.7731*%i), %inf;
           %inf, (0.3669+0.7731*%i), %inf, (0.3863+1.799*%i);
           (0.418+1.918*%i), %inf, (0.3863+1.799*%i), %inf];

trans_12 = [0.784*%i;0.781*%i;1.31*%i];
trans_0 = trans_12;

shunt_12 = [1/(0.011+0.1141*%i), 0, 0, 0];
shunt_0 = [1/(0.4201*%i), 0, 0, 0];

z_f = 0;

V = [1,1,1,1];

Sb = 100e6;
Vb1 = 69e3;
Vb2 = 13.8e3;
Ib1 = Sb/Vb1;
Ib2 = Sb/Vb2;

[z_bus1,#,z_bus0] = line2bus(z_line12, z_line12, z_line0, shunt_12, shunt_12, shunt_0);
[ICC_3f, ICC_2f, ICC_1f] = falt_current(V,z_bus1,z_bus1,z_bus0,z_f);
[VCC_3f, VCC_2f, VCC_1f] = voltage(V,z_bus1,z_bus1,z_bus0,ICC_3f,ICC_2f,ICC_1f);
[I1_3f,I2_3f,I0_3f,I1_2f,I2_2f,I0_2f,I1_1f,I2_1f,I0_1f] = line_current(VCC_3f,VCC_2f,VCC_1f,z_line12,z_line12,z_line0)

// QUESTÃO 2

//z_line12 = [%inf, (0.3406+0.826*%i), %inf, (0.2128+0.516*%i), %inf;
//            (0.3406+0.826*%i), %inf, (0.2923+0.247*%i), %inf, %inf;
//            %inf, (0.2923+0.247*%i), %inf, (0.1996+0.484*%i), %inf;
//            (0.2128+0.516*%i), %inf, (0.1996+0.484*%i), %inf, (1.31*%i);
//            %inf, %inf, %inf, (1.31*%i),%inf];
//            
//z_line0 = [%inf, (0.6591+3.069*%i), %inf, (0.4118+1.918*%i), %inf;
//           (0.6591+3.069*%i), %inf, (0.3669+0.7731*%i), %inf, %inf;
//           %inf, (0.3669+0.7731*%i), %inf, (0.3863+1.799*%i), %inf;
//           (0.418+1.918*%i), %inf, (0.3863+1.799*%i), %inf, %inf;
//           %inf, %inf, %inf, %inf,%inf];
//
//trans_12 = [0.784*%i;0.781*%i;1.31*%i];
//trans_0 = trans_12;
//
//shunt_12 = [1/(0.011+0.1141*%i), 0, 0, 0, 0];
//shunt_0 = [1/(0.4201*%i), 0, 0, 0, 1/trans_12(3)];
//
//z_f = 0;
//
//V = [1,1,1,1];
//
//Sb = 100e6;
//Vb1 = 69e3;
//Vb2 = 13.8e3;
//Ib1 = Sb/Vb1;
//Ib2 = Sb/Vb2;
//
//[z_bus1,#,z_bus0] = line2bus(z_line12, z_line12, z_line0, shunt_12, shunt_12, shunt_0);
//[ICC_3f, ICC_2f, ICC_1f] = falt_current(V,z_bus1,z_bus1,z_bus0,z_f);
//[VCC_3f, VCC_2f, VCC_1f] = voltage(V,z_bus1,z_bus1,z_bus0,ICC_3f,ICC_2f,ICC_1f);
//[I1_3f,I2_3f,I0_3f,I1_2f,I2_2f,I0_2f,I1_1f,I2_1f,I0_1f] = line_current(VCC_3f,VCC_2f,VCC_1f,z_line12,z_line12,z_line0);





