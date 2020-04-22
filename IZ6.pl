get_graph_edges(V,E):-get_V(V),nl,get_edges(V,E), nl, write("Максимальное паросочетание:"), maxMatching(E, List), write(List), nl, findExpendingWay(List, E, Way), write('Расширяющий путь: '), write(Way).

	get_V(V):- write('Количество вершин:'),read(N),write("Vertexes"),nl,N1 is N+1,get_V(V1,N1),del_1st(V1,V).
	get_V([],0):-!.
	get_V([H|T],N):-read_str(X),name(H,X),N1 is N-1,get_V(T,N1).

	get_edges(V,E):-write('Количество рёбер:'),read(M),get0(X),get_edges(V,E,[],M,0).
	get_edges(V,E,E,M,M):-!.
	get_edges(V,E,Edges,M,Count):-get_edge(V,Edge),append(Edges,[Edge],E1), Count1 is Count+1,get_edges(V,E,E1,M,Count1).

del_1st([_|T],T).

read_str(A):-get0(X),r_str(X,A,[]).

r_str(10,A,A):-!.
r_str(X,A,B):-append(B,[X],B1),get0(X1),r_str(X1,A,B1).

get_edge(V,[V1,V2]):-write("Edge"),nl,read_str(X),name(V1,X),check_vertex(V,V1),
						read_str(Y),name(V2,Y),check_vertex(V,V2).

check_vertex([V1|_],V1):-!.
check_vertex([_|T],V1):-check_vertex(T,V1).

/*Поиск максимального паросочетания*/
maxMatching([],[]):-!.
maxMatching([H|T], ResultMatching):- maxMatching(T, [H], ResultMatching).
maxMatching([], CurMathing, CurMathing):- !.
maxMatching([H|T], CurMatching, ResultMatching):- not(hasAdjacent(H, CurMatching)), append(CurMatching, [H], NewMatching), maxMatching(T, NewMatching, ResultMatching), !.
maxMatching([_|T], CurMatching, ResultMatching):- maxMatching(T, CurMatching, ResultMatching).

hasAdjacent([_,_], []):- !, fail.
hasAdjacent([X,_], [[X,_]|_]):- !.
hasAdjacent([X,_], [[_,X]|_]):- !.
hasAdjacent([_,X], [[X,_]|_]):- !.
hasAdjacent([_,X], [[_,X]|_]):- !.
hasAdjacent(Edge, [_|T]):- hasAdjacent(Edge, T).

/*Нахождение расширяющего пути*/
findExpendingWay(Matching, E, ExpWay):- findExpendingWay(Matching, E, [], ExpWay).
findExpendingWay(Matching, [H|T], [], ExpWay):- not(contains(Matching, H)), findAdjacent(H, Matching, AdjEdge), append([AdjEdge], [H], CurWay), in_list_exlude(Matching, AdjEdge, NewMatching), findExpendingWay(NewMatching, T, CurWay, ExpWay),!.
findExpendingWay(Matching, [_|T], [], ExpWay):- findExpendingWay(Matching, T, [], ExpWay),!.
findExpendingWay([],E, [H|_], ExpWay):- findAdjacent(H, E, AdjEdge), AdjEdge = [], ExpWay = [],!.
findExpendingWay([],E, [H|T], ExpWay):- findAdjacent(H, E, AdjEdge), append([AdjEdge], [H], TempHead), append(TempHead, T, NewWay), ExpWay = NewWay, !.
findExpendingWay(Matching, E,[H|T], ExpWay):- findAdjacent(H, E, AdjEdge), AdjEdge \= [], append(AdjEdge, H, TempHead), append(TempHead, T, CurWay), findAdjacent(AdjEdge, Matching, AdjEdge2), append(AdjEdge2, CurWay, NewWay), in_list_exlude(Matching, AdjEdge2, NewMatching), in_list_exlude(E, AdjEdge, NewE), findExpendingWay(NewMatching, NewE, NewWay, ExpWay), !.


in_list_exlude([El|T],El,T).
in_list_exlude([H|T],El,[H|Tail]):-in_list_exlude(T,El,Tail).


findAdjacent([_,_], [], []):- !.
findAdjacent([X,Y], [[X,Z]|_],[Z,X]):- !.
findAdjacent([X,Y], [[Z,X]|_], [Z,X]):- !.
findAdjacent([Y,X], [[X,Z]|_], [Z,X]):- !.
findAdjacent([Y,X], [[Z,X]|_], [Z,X]):- !.
findAdjacent(Edge, [_|T], AdjEdge):- findAdjacent(Edge, T, AdjEdge).

contains([], _):- !, fail.
contains([H|_], H):- !.
contains([_|T], N):- contains(T, N).


