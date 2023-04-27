solve(P):-
	permutation([1,2,3,4],P),
	combine([1,2,3,4],P,S,D),
	all_diff(S),
	all_diff(D).
	
combine([],[],[],[]).
combine([X1|X],[Y1|Y],[S1|S],[D1|D]):-
	S1 is X1 + Y1,
	D1 is X1 - Y1,
	combine(X,Y,S,D).
	
all_diff([X]).
all_diff([X|Y]) :- \+member(X,Y),all_diff(Y).

/*
