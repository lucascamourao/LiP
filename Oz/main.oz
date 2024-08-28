declare     
[funtor] = {Module.link ['funtorr.ozf']}
[circuitos] = {Module.link ['circuitos.ozf']}


% subtrator completo
declare
X=1|1|0|_
Y=0|1|0|_
Z=1|1|1|_ C S in
{circuitos.fullsub X Y Z C S}
{Browse inp(X Y Z)#sub(C S)}



declare

B1 = 1|0|0|1|1|_
B2 = 1|0|1|0|1|_
B3 = 0|1|1|0|1|_
B4 = 1|0|1|1|1|_
B5 = 1|0|0|1|0|_
B6 = 1|1|0|0|0|_
Res = "Resultado: "

S S1 S2 S3 S4 in
%meio somador
{circuitos.halfadder B1 B2 S S1}  
{Browse Res}
{Browse S S1}

%mux
{circuitos.mux B4 B5 B6 S4}
{Browse Res}
{Browse S4}