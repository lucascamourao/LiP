% The Flavius Josephus problem (sequential stateful model) WITHOUT short circuiting

declare
fun {JosephusSeq N K}
   Roda = {NewArray N nil}
   Ultimo
in
   for I in 1..N do
      Roda.I = {NewCell {NewCell I K} true}
   end
   Ultimo = Roda.N
   for I in 1..N-1 do
      {Roda.I.2} := Roda.(I+1)
   end
   {Roda.N.2} := Roda.1

   local
      fun {Kill X S I}
         if S == 1 then Ultimo = I
         elseif X mod K == 0 then
            {Roda.I.2.2} := {Roda.I.2.2} - 1
            {Kill X+1 S-1 I}
         else
            {Kill X+1 S I}
         end
      end
   in
      {Kill 1 N 1}
   end
   Ultimo
end