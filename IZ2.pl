primeDividers(0, []):-!.
primeDividers(1, []):-!.
primeDividers(Num, X):- findDividers(Num, 2,[], X).

findDividers(Num, Num, List, ResultList):- prime(Num), append(List, [Num], ResultList), !.
findDividers(Num, Divider, List, ResultList):- Remainder is Num mod Divider, Remainder = 0, prime(Divider),  X is Num / Divider,  append(List, [Divider], NewList), findDividers(X, Divider, NewList, ResultList),!.
findDividers(Num, Divider, List, ResultList):- NextDivivder is Divider + 1, findDividers(Num, NextDivivder, List, ResultList).

prime(X):- prime(X, 2).
prime(0,_):-!,fail.
prime(1,_):-!,fail.
prime(X, N):-N2 is N*N, N2 > X,!.
prime(X, N):-Remainder is X mod N, Remainder \= 0, N1 is N + 1, prime(X, N1).
