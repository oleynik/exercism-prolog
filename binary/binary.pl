parse('0', 0):-!.
parse('1', 1):-!.
parse(_, 0):-fail.

calc(-1, _, 0):-!.
calc(P, [E | List], R) :- 
    Prev is P-1,
    calc(Prev, List, M), 
    parse(E, N),
    R is N*2^P + M.

binary(Str, Dec) :- 
    string_chars(Str, Chars),
    length(Chars, L),
    Lenght is L-1,
    calc(Lenght, Chars, Dec).
