% valid(+Coord)
% 
% The valid/1 predicate succeeds if Coord is a 0-Base chessboard coordinate.
valid(Coord) :- Coord >=0 , Coord < 8.

%! create(+DimTuple)
%
% The create/1 predicate succeeds if the DimTuple contains valid chessboard 
% dimensions, e.g. (0,0) or (2,4).
create((DimX, DimY)) :- valid(DimX), valid(DimY).


line_attach(A, B) :- A =:= B.
%! attack(+FromTuple, +ToTuple)
%
% The attack/2 predicate succeeds if a queen positioned on ToTuple is 
% vulnerable to an attack by another queen positioned on FromTuple.
attack((FromX, FromY), (ToX, ToY)):-
	create((FromX, FromY)),
	create((ToX, ToY)),
	line_attach(FromX, ToX);
	line_attach(FromY, ToY);
	line_attach((abs(FromX - ToX)), (abs(FromY - ToY))).
