declare NotLoop NotG Xs
local
   fun {NotLoop X}
   case Xs of X|Xr then (1-X) | {NotLoop Xr} end
   end
in
   fun {NotG X}
      thread {NotLoop X} end
   end
end


declare
fun {GateMaker F}
   fun {$ Xs Ys}
      fun {GateLoop Xs Ys}
	 case Xs#Ys of (X|Xr)#(Y|Yr) then
	    {F X Y}|{GateLoop Xr Yr}
	 end
      end
in
      thread {GateLoop Xs Ys} end
   end
end



declare
fun {OrG X Y}
   {GateMaker fun {$ X Y} X+Y-X*Y end}
end

declare NandG
fun{NandG X Y}
   {GateMaker fun {$ X Y} 1-X*Y end}
end

declare NorG
fun{NorG X Y}
   {GateMaker fun {$ X Y} 1-X-Y+X*Y end}
end

declare XorG
fun{XorG X Y}
   {GateMaker fun {$ X Y} X+Y-2*X*Y end}
end

declare AndG
fun {AndG X Y}
   {GateMaker fun {$ X Y} X*Y end}
end







   






declare 
fun {FullAdder X Y Z}
   local
      K={AndG X Y}
      L={AndG Y Z}
      M={AndG X Z}
      C={OrG K{OrG L M}}
      S={XorG Z {XorG X Y}}
   in
      {C S}
   end
end





declare Fullsub A B C D Bout
fun {Fullsub X Y Z}
   local
      A = {XorG X Y}
      B = {AndG {NotG X} Y}
      C = {AndG Z {NotG A}}
      D = {XorG Z A}
      Bout = {OrG B {AndG {NotG A} Z}}
   in
      {D Bout}
   end
end



declare
proc {Fullsubb X Y Z ?D ?Bout}
   A B C
in 
      A = {XorG X Y}
      B = {AndG {NotG X} Y}
      C = {AndG Z {NotG A}}
      D = {XorG Z A}
      Bout = {OrG B {AndG {NotG A} Z}}
end


declare
X=1|1|0|_
Y=0|1|0|_
Z=1|1|1|_ C S in
{Fullsubb  X Y Z C S}
{Browse inp(X Y Z)#sub(C S)}







declare 
proc {MUX X Y Z ?Xout}
   A B 
in
   A = {AndG {NotG S} X}
   B = {AndG S Y}
   Xout = {OrG A B}
end

declare 
proc {HalfAdder A B ?Sum ?Carry}
   C D
in
    C= {XorG A B}
    D = {AndG A B}
    Sum=C
    Carry=D
end




declare

B1 = 1|0|0|1|1|_
B2 = 1|0|1|0|1|_
B3 = 0|1|1|0|1|_
B4 = 1|0|1|1|1|_
B5 = 1|0|0|1|0|_
B6 = 1|1|0|0|0|_


S S1 S2 S3 S4 in





%meio somador
{HalfAdder B1 B2  S1 S2}  
{Browse  'entradas'}
{Browse B1}
{Browse B2}
{Browse 'Resultado'}
{Browse S1}
{Browse S2}


%mux
{MUX B1 B2 B3 S4}
{Browse 'entradas'}
{Browse B1}
{Browse B2}
{Browse B3}
{Browse 'Resultado'}
{Browse S4}
