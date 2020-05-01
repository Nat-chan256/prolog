get_graph_edges(V,E):-get_V(V),nl,get_edges(V,E), nl, write("Наибольшее паросочетание:"), findMaxMatching(V, E, List), write(List).

/*Поиск наибольшего паросочетания*/
findMaxMatching(V, E, List):- maxMatching(E, Matching), findExpendingWay(Matching, E, V, ExpWay), symmetricSubtraction(Matching, ExpWay, List), !.
findMaxMatching(_, E, List):- maxMatching(E, List).

/*Симметрическая разность расширяющего пути и паросочетания*/
symmetricSubtraction(Matching, ExpWay, ResultMatching):- symmetricSubtraction(Matching, ExpWay, [], ResultMatching).
symmetricSubtraction(Matching, [], CurSub, ResultMatching):- append(Matching, CurSub, ResultMatching), !.
symmetricSubtraction(Matching, [H|T], CurSub, ResultMatching):- not(contains(Matching, H)), append(CurSub, [H], NewSub), symmetricSubtraction(Matching, T, NewSub, ResultMatching),!.
symmetricSubtraction(Matching, [H|T], CurSub, ResultMatching):- in_list_exlude(Matching, H, NewMatching), symmetricSubtraction(NewMatching, T, CurSub, ResultMatching).

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
findExpendingWay(Matching, E, V, ExpWay):- in_list(V, Vertex1), not(isInMatching(Matching, Vertex1)), in_list(V, Vertex2), not(isInMatching(Matching, Vertex2)), Vertex1 \= Vertex2, makeAlternateWay(V, E, Matching, Vertex1, Vertex2, ExpWay).
/**/
isInMatching([],_):- !, fail.
isInMatching([[X,_]|_], X):-!.
isInMatching([[_,X]|_], X):-!.
isInMatching([_|T], X):- isInMatching(T, X).

/*Построение чередующегося пути из вершины I в вершину S*/
makeAlternateWay(V, E, Matching, I,S,Way):- incident(I, NewI, Edge, E), in_list_exlude(V,I,Tail), in_list_exlude(Tail, NewI, Tail1), makeAlternateWay(Tail1,E, Matching, NewI,S,[Edge],Way, m).
makeAlternateWay(_,_,_,S,S,Way,Way,_):-!.
makeAlternateWay(V,E, Matching, I,S,Cur_Way,Way, m):-in_list_exlude(V,X,Tail),(in_list1(E,[I,X]);in_list1(E,[X,I])), (in_list(Matching, [I,X]); in_list(Matching, [X,I])), append1(Cur_Way,[[I,X]],C_W), makeAlternateWay(Tail,E, Matching, X,S,C_W,Way, nm).
makeAlternateWay(V,E, Matching, I,S,Cur_Way,Way, nm):-in_list_exlude(V,X,Tail),(in_list1(E,[I,X]);in_list1(E,[X,I])), not(in_list(Matching, [I,X])), not(in_list(Matching, [X,I])), append1(Cur_Way,[[I,X]],C_W), makeAlternateWay(Tail,E,Matching,X,S,C_W,Way,m).

/*in_list для рёбер*/
in_list1([[X,Y]|_],[X,Y]):-!.
in_list1([[Y,X]|_],[X,Y]):-!.
in_list1([_|T],El):-in_list1(T,El).

append1([],X,X):-!.
append1([H|T],X,[H |Z]):-append1(T,X,Z).

/*Поиск ребра, инцидентного вершине Vertex*/
incident(Vertex, Vertex2, [Vertex, Vertex2],[[Vertex, Vertex2]|_]).
incident(Vertex, Vertex2, [Vertex2, Vertex], [[Vertex2, Vertex]|_]).
incident(Vertex, Vert, Edge, [_|T]):- incident(Vertex, Vert, Edge, T).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

in_list_exlude([El|T],El,T).
in_list_exlude([H|T],El,[H|Tail]):-in_list_exlude(T,El,Tail).

contains([], _):- !, fail.
contains([H|_], H):- !.
contains([_|T], N):- contains(T, N).
