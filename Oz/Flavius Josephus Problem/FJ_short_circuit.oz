% The Flavius Josephus problem (sequential stateful model) WITH short circuiting

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
            if {Roda.I.2.2} > 0 then
                {Roda.I.2.2} := {Roda.I.2.2} - 1
                {Kill X+1 S-1 I}
            else
                skip  % lazy evaluation: pula a chamada recursiva se {Roda.I.2.2} <= 0
            end
            else {Kill X+1 S I} end
        end
    in
        {Kill 1 N 1 Ultimo}
    end
    Ultimo
end