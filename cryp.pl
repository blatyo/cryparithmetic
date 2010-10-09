isCarry(X) :-
		X = 0 
	| X = 1.

isDigit(X) :- 
	isCarry(X) 
	| X = 2
	| X = 3
	| X = 4
	| X = 5
	| X = 6
	| X = 7
	| X = 8
	| X = 9.

allDifferent([_]).
allDifferent([X, Y | L]) :-
	not(X = Y),
	allDifferent([X | L]),
	allDifferent([Y | L]).

constraint(W, X, Y, Z) :-
	(W * 10) + X = (2 * Y) + Z.

constraint(F) :-
	not(F = 0).

solve(S) :-
	values(T, W, O, F, U, R, C1, C2, C3),
	constraint(F),
	constraint(0, F, 0, C3),
	constraint(C3, O, T, C2),
	constraint(C2, U, W, C1),
	constraint(C1, R, O, 0),
	allDifferent(T, W, O, F, U, R),
	S = [T, W, O, F, U, R].