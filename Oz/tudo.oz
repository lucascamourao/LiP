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

declare GateMaker
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

declare AndG
fun {AndG X Y}
   {GateMaker fun {$ X Y} X*Y end}
end

declare OrgG
fun {OrG X Y}
   {GateMaker fun {$ X Y} X+Y-X*Y end}
end

declare NandG
fun {NandG X Y}
   {GateMaker fun {$ X Y} 1-X*Y end}
end

declare NorG
fun {NorG X Y}
   {GateMaker fun {$ X Y} 1-X-Y+X*Y end}
end

declare XorG
fun {XorG X Y}
   {GateMaker fun {$ X Y} X+Y-2*X*Y end}
end

declare HalfAdder Sum Carry
fun {HalfAdder A B}
   Sum = {XorG A B}
   Carry = {AndG A B}
   {Sum Carry}
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

declare MUX S
fun {MUX X Y S Xout}
     A = {AndG {NotG S} X}
     B = {AndG S Y}
     Xout = {OrG A B}
     Xout
end

declare X1 X2 X3
X1 = 1|0|1|_
X2 = 1|1|0|_
X3 = 1|1|1|_
{Browse {NotG X1}}