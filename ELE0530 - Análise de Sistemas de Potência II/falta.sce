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
    //falta na barra n
    ICC_3f(1) = V(n)/(zb1(n,n)+zf); 
    ICC_3f(2) = 0;
    ICC_3f(3) = 0;
    
    ICC_2f(1) = V(n)/(zb1(n,n)+zb2(n,n)+z_f); 
    ICC_2f(2) = -ICC_2f(1);
    ICC_2f(3) = 0;
    
    ICC_1f(1) = V(n)/(zb1(n,n)+zb2(n,n)+zb0(n,n)+z_f); 
    ICC_1f(2) = ICC_1f(1);
    ICC_1f(3) = ICC_1f(1);
endfunction

function [VCC_3f, VCC_2f, VCC_1f] = voltage(V,zb1,zb2,zb0,ICC_3f,ICC_2f,ICC_1f,n)
    m = length(V)
    for i = 1:m
       VCC_3f(1,i) = V(i)-zb1(i,n)*ICC_3f(1); 
       VCC_3f(2,i) = -zb2(i,n)*ICC_3f(2);
       VCC_3f(3,i) = -zb0(i,n)*ICC_3f(3);
    end
    for i = 1:m
       VCC_2f(1,i) = V(i)-zb1(i,n)*ICC_2f(1); 
       VCC_2f(2,i) = -zb2(i,n)*ICC_2f(2);
       VCC_2f(3,i) = -zb0(i,n)*ICC_2f(3);
    end
    for i = 1:m
       VCC_1f(1,i) = V(i)-zb1(i,n)*ICC_1f(1); 
       VCC_1f(2,i) = -zb2(i,n)*ICC_1f(2);
       VCC_1f(3,i) = -zb0(i,n)*ICC_1f(3);
    end
endfunction

function [I1_3f,I2_3f,I0_3f,I1_2f,I2_2f,I0_2f,I1_1f,I2_1f,I0_1f] = line_current(VCC_3f,VCC_2f,VCC_1f,Z1,Z2,Z0)
    m = length(VCC_3f(1,:));
    for i = 1:m //falta na barra
        for j = 1:m //de
            I1_3f(i,j) = (VCC_3f(1,i)-VCC_3f(1,j))/Z1(i,j);    
            I2_3f(i,j) = (VCC_3f(2,i)-VCC_3f(2,j))/Z2(i,j);
            I0_3f(i,j) = (VCC_3f(3,i)-VCC_3f(3,j))/Z0(i,j);
        end
    end
    for i = 1:m //falta na barra
        for j = 1:m //de
            I1_2f(i,j) = (VCC_2f(1,i)-VCC_2f(1,j))/Z1(i,j);    
            I2_2f(i,j) = (VCC_2f(2,i)-VCC_2f(2,j))/Z2(i,j);
            I0_2f(i,j) = (VCC_2f(3,i)-VCC_2f(3,j))/Z0(i,j);
        end
    end
    for i = 1:m //falta na barra
        for j = 1:m //de
            I1_1f(i,j) = (VCC_1f(1,i)-VCC_1f(1,j))/Z1(i,j);    
            I2_1f(i,j) = (VCC_1f(2,i)-VCC_1f(2,j))/Z2(i,j);
            I0_1f(i,j) = (VCC_1f(3,i)-VCC_1f(3,j))/Z0(i,j);
        end
    end
endfunction
function th = ang(com)
    if real(com)>0 then
        th = atand(imag(com)/real(com));
    else
        th = atand(imag(com)/real(com))+180;
        if (th>180) then
            th = th-360;
        elseif (th<-180) then 
            th = th+360; 
        end
    end
endfunction

           


// QUESTÃO 1

//z_line12 = [%inf, (0.3406+0.826*%i), %inf, (0.2128+0.516*%i);
//            (0.3406+0.826*%i), %inf, (0.2923+0.247*%i), %inf;
//            %inf, (0.2923+0.247*%i), %inf, (0.1996+0.484*%i);
//            (0.2128+0.516*%i), %inf, (0.1996+0.484*%i), %inf];
//            
//z_line0 = [%inf, (0.6591+3.069*%i), %inf, (0.4118+1.918*%i);
//           (0.6591+3.069*%i), %inf, (0.3669+0.7731*%i), %inf;
//           %inf, (0.3669+0.7731*%i), %inf, (0.3863+1.799*%i);
//           (0.418+1.918*%i), %inf, (0.3863+1.799*%i), %inf];
//
//trans_12 = [0.784*%i;0.781*%i;1.31*%i];
//trans_0 = trans_12;
//
//shunt_12 = [1/(0.011+0.1141*%i), 0, 0, 0];
//shunt_0 = [1/(0.4201*%i), 0, 0, 0];
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
//n = 4;
//
//[z_bus1,#,z_bus0] = line2bus(z_line12, z_line12, z_line0, shunt_12, shunt_12, shunt_0);
//[ICC_3f, ICC_2f, ICC_1f] = falt_current(V,z_bus1,z_bus1,z_bus0,z_f,n);
//[VCC_3f, VCC_2f, VCC_1f] = voltage(V,z_bus1,z_bus1,z_bus0,ICC_3f,ICC_2f,ICC_1f,n);
//[I1_3f,I2_3f,I0_3f,I1_2f,I2_2f,I0_2f,I1_1f,I2_1f,I0_1f] = line_current(VCC_3f,VCC_2f,VCC_1f,z_line12,z_line12,z_line0)



// QUESTÃO 2

z_line12 = [%inf, (0.3406+0.826*%i), %inf, (0.2128+0.516*%i), %inf;
            (0.3406+0.826*%i), %inf, (0.2923+0.247*%i), %inf, %inf;
            %inf, (0.2923+0.247*%i), %inf, (0.1996+0.484*%i), %inf;
            (0.2128+0.516*%i), %inf, (0.1996+0.484*%i), %inf, (1.31*%i);
            %inf, %inf, %inf, (1.31*%i),%inf];
            
z_line0 = [%inf, (0.6591+3.069*%i), %inf, (0.4118+1.918*%i), %inf;
           (0.6591+3.069*%i), %inf, (0.3669+0.7731*%i), %inf, %inf;
           %inf, (0.3669+0.7731*%i), %inf, (0.3863+1.799*%i), %inf;
           (0.418+1.918*%i), %inf, (0.3863+1.799*%i), %inf, %inf;
           %inf, %inf, %inf, %inf,%inf];

trans_12 = [0.784*%i;0.781*%i;1.31*%i];
trans_0 = trans_12;

shunt_12 = [1/(0.011+0.1141*%i), 0, 0, 0, 0];
shunt_0 = [1/(0.4201*%i), 0, 0, 0, 1/trans_12(3)];

z_f = 0;

V = [1,1,1,1,1];

n = 5;

Sb = 100e6;
Vb1 = 69e3;
Vb2 = 13.8e3;
Ib1 = Sb/Vb1;
Ib2 = Sb/Vb2;

[z_bus1,#,z_bus0] = line2bus(z_line12, z_line12, z_line0, shunt_12, shunt_12, shunt_0);
[ICC_3f, ICC_2f, ICC_1f] = falt_current(V,z_bus1,z_bus1,z_bus0,z_f,5);
[VCC_3f, VCC_2f, VCC_1f] = voltage(V,z_bus1,z_bus1,z_bus0,ICC_3f,ICC_2f,ICC_1f,5);
[I1_3f,I2_3f,I0_3f,I1_2f,I2_2f,I0_2f,I1_1f,I2_1f,I0_1f] = line_current(VCC_3f,VCC_2f,VCC_1f,z_line12,z_line12,z_line0);


fd = mopen(TMPDIR+'/text.txt','wt');

mfprintf(fd,'CÁLCULO DE CURTO-CIRCUITO EM COMPONENTES DE SEQUÊNCIA E POR UNIDADE\n');
mfprintf(fd,'\n');
mfprintf(fd,'-----------------------------------------------------------------------\n');
mfprintf(fd,'\n');
mfprintf(fd,'Simulação de curto-circuito na barra: %d\n',n);
mfprintf(fd,'\n');
mfprintf(fd,'-----------------------------------------------------------------------\n');
mfprintf(fd,'\n');
mfprintf(fd,'Correntes de curto-circuito: \n');
mfprintf(fd,'   - Falta trifásica\n');
mfprintf(fd,'      seq.+ ICC(%d) = %f<)%f p.u\n', n, abs(ICC_3f(1)),ang(ICC_3f(1)));
mfprintf(fd,'      seq.- ICC(%d) = %f<)%f p.u\n', n, abs(ICC_3f(2)),ang(ICC_3f(2)));
mfprintf(fd,'      seq.0 ICC(%d) = %f<)%f p.u\n', n, abs(ICC_3f(3)),ang(ICC_3f(3)));
mfprintf(fd,'   - Falta bifásica\n');
mfprintf(fd,'      seq.+ ICC(%d) = %f<)%f p.u\n', n, abs(ICC_2f(1)),ang(ICC_2f(1)));
mfprintf(fd,'      seq.- ICC(%d) = %f<)%f p.u\n', n, abs(ICC_2f(2)),ang(ICC_2f(2)));
mfprintf(fd,'      seq.0 ICC(%d) = %f<)%f p.u\n', n, abs(ICC_2f(3)),ang(ICC_2f(3)));
mfprintf(fd,'   - Falta monofásica\n');
mfprintf(fd,'      seq.+ ICC(%d) = %f<)%f p.u\n', n, abs(ICC_1f(1)),ang(ICC_1f(1)));
mfprintf(fd,'      seq.- ICC(%d) = %f<)%f p.u\n', n, abs(ICC_1f(2)),ang(ICC_1f(2)));
mfprintf(fd,'      seq.0 ICC(%d) = %f<)%f p.u\n', n, abs(ICC_1f(3)),ang(ICC_1f(3)));
mfprintf(fd,'\n');
mfprintf(fd,'-----------------------------------------------------------------------\n');
mfprintf(fd,'\n');
mfprintf(fd,'Tensões nas barras após a falta: \n');
mfprintf(fd,'\n');
for i = 1:length(V)
    mfprintf(fd,'Barra %d: \n',i);
    mfprintf(fd,'   - Falta trifásica\n');
    mfprintf(fd,'      seq.+ VCC(%d) = %f<)%f p.u\n', i, abs(VCC_3f(1,i)),ang(VCC_3f(1,i)));
    mfprintf(fd,'      seq.- VCC(%d) = %f<)%f p.u\n', i, abs(VCC_3f(2,i)),ang(VCC_3f(2,i)));
    mfprintf(fd,'      seq.0 VCC(%d) = %f<)%f p.u\n', i, abs(VCC_3f(3,i)),ang(VCC_3f(3,i)));
    mfprintf(fd,'   - Falta bifásica\n');
    mfprintf(fd,'      seq.+ VCC(%d) = %f<)%f p.u\n', i, abs(VCC_2f(1,i)),ang(VCC_2f(1,i)));
    mfprintf(fd,'      seq.- VCC(%d) = %f<)%f p.u\n', i, abs(VCC_2f(2,i)),ang(VCC_2f(2,i)));
    mfprintf(fd,'      seq.0 VCC(%d) = %f<)%f p.u\n', i, abs(VCC_2f(3,i)),ang(VCC_2f(3,i)));
    mfprintf(fd,'   - Falta monofásica\n');
    mfprintf(fd,'      seq.+ VCC(%d) = %f<)%f p.u\n', i, abs(VCC_1f(1,i)),ang(VCC_1f(1,i)));
    mfprintf(fd,'      seq.- VCC(%d) = %f<)%f p.u\n', i, abs(VCC_1f(2,i)),ang(VCC_1f(2,i)));
    mfprintf(fd,'      seq.0 VCC(%d) = %f<)%f p.u\n', i, abs(VCC_1f(3,i)),ang(VCC_1f(3,i)));
    mfprintf(fd,'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
end
mfprintf(fd,'\n');
mfprintf(fd,'-----------------------------------------------------------------------\n');
mfprintf(fd,'\n');
mfprintf(fd,'Correnntes nas linhas após a falta: \n');
mfprintf(fd,'\n');
mfprintf(fd,'   - Falta trifásica\n');
for i = 1:length(V)
    for j = 1:length(V)
        mfprintf(fd,'      seq.+ I(%d,%d) = %f<)%f p.u\n', i, j, abs(I1_3f(i,j)),ang(I1_3f(i,j)));
        mfprintf(fd,'      seq.- I(%d,%d) = %f<)%f p.u\n', i, j, abs(I2_3f(i,j)),ang(I2_3f(i,j)));
        mfprintf(fd,'      seq.0 I(%d,%d) = %f<)%f p.u\n', i, j, abs(I0_3f(i,j)),ang(I0_3f(i,j)));
        mfprintf(fd,'\n');
        mfprintf(fd,'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
   end
end
mfprintf(fd,'   - Falta bifásica\n');
for i = 1:length(V)
    for j = 1:length(V)
        mfprintf(fd,'      seq.+ I(%d,%d) = %f<)%f p.u\n', i, j, abs(I1_2f(i,j)),ang(I1_2f(i,j)));
        mfprintf(fd,'      seq.- I(%d,%d) = %f<)%f p.u\n', i, j, abs(I2_2f(i,j)),ang(I2_2f(i,j)));
        mfprintf(fd,'      seq.0 I(%d,%d) = %f<)%f p.u\n', i, j, abs(I0_2f(i,j)),ang(I0_2f(i,j)));
        mfprintf(fd,'\n');
        mfprintf(fd,'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
   end
end
mfprintf(fd,'   - Falta monofásica\n');
for i = 1:length(V)
    for j = 1:length(V)
        mfprintf(fd,'      seq.+ I(%d,%d) = %f<)%f p.u\n', i, j, abs(I1_1f(i,j)),ang(I1_1f(i,j)));
        mfprintf(fd,'      seq.- I(%d,%d) = %f<)%f p.u\n', i, j, abs(I2_1f(i,j)),ang(I2_1f(i,j)));
        mfprintf(fd,'      seq.0 I(%d,%d) = %f<)%f p.u\n', i, j, abs(I0_1f(i,j)),ang(I0_1f(i,j)));
        mfprintf(fd,'\n');
        mfprintf(fd,'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
   end
end
mclose(fd);
if (isdef('editor') | (funptr('editor')<>0)) then
  editor(TMPDIR+'/text.txt')
end
mfprintf(0,'stderr output.\n');
mfprintf(6,'stdout output.\n');


