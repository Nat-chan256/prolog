sum_of_list:- read(N), read_list(A, N), sum_list(A, Sum), write(Sum).

read_list(A, N):- read_list([], A, 0, N).
read_list(A, A, N, N):- !.
read_list(List, A, I, N):- I1 is I+1, read(X), append(List, [X], List1), read_list(List1, A, I1, N).

sum_list(A, Sum):- sum_list(A, 0, Sum).
sum_list([], Sum, Sum):- !.
sum_list([H|T], S, Sum):- S1 is S + H, sum_list([T], S1, Sum).

pz3_2:-read(N), read_list(A, N), element(A, 0, N, X), write(X).
element([], _, _, _):- write("Слишком большой индекс"), !, fail.
element([H|_],Ind, Ind, H):- !.
element([_|T], CurInd, Ind, X):- NewInd is CurInd + 1, element([T], NewInd, Ind, X).

pr3_3:- read(N), read_list(A, N), min(A, 10000, X), write(X).

min([],CurMin, CurMin):- !.
min([H|T], CurMin, X):- H < CurMin, NewMin is H, min(T,NewMin,X), !.
min([_|T], CurMin, X):- min(T, CurMin, X).

