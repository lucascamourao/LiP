functor
export NotG: NotG AndG: AndG OrG: OrG NandG: NandG NorG: NorG XorG: XorG
define 
   local
      declare NotLoop NotG Xs
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
end  