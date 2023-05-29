validate(Side1, Side2, Side3) :- 
    Side1 > 0.0,
    Side2 > 0.0,
    Side3 > 0.0,
    (Side1 + Side2) >= Side3,
    (Side1 + Side3) >= Side2,
    (Side2 + Side3) >= Side1.

triangle(Side1, Side2, Side3, "equilateral") :- 
    validate(Side1, Side2, Side3),
    Side1 =:= Side2,
    Side2 =:= Side3.

isosceles(Side, Side, _).
isosceles(Side, _, Side).
isosceles(_, Side, Side).

triangle(Side1, Side2, Side3, "isosceles") :- validate(Side1, Side2, Side3), isosceles(Side1, Side2, Side3).

triangle(Side1, Side2, Side3, "scalene") :- 
    validate(Side1, Side2, Side3),
    not(triangle(Side1, Side2, Side3, "equilateral")),
    not(triangle(Side1, Side2, Side3, "isosceles")).