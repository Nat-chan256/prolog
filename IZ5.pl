build_words:- write('¬ведите n: '), read(N), write('¬ведите k: '), read(K), write('¬ведите m: '), read(M), tell('file_iz5.txt'), build_all_words(N, M, K).
build_words:- told.

build_all_words(N, M, K):- N1 is N - M, N2 is N1 - K, build_all_razm([a, b, d, e], N2, M, K).

in_list_include(El, [El|T], [El|Result]):- in_list_include(El, T, Result), !.
in_list_include(El, List, [El|List]).
in_list_include(El, [H|T], [H|Result]):- in_list_include(El, T, Result).

in_list_exlude([El|T],El,T).
in_list_exlude([H|T],El,[H|Tail]):-in_list_exlude(T,El,Tail).

build_all_razm(List, N, M, K):- b_a_r(List, 0, N, [], M, K).
b_a_r(_, Counter, N, _, _, _):- Counter > N, !, fail.
b_a_r(_, N, N, CurList, M, K):- insert(CurList, f, c, M, K).
b_a_r([], _, _, _, _, _):- !,fail.
b_a_r(List, Counter, N, CurList, M, K):-in_list_exlude(List,El,List1), Counter1 is Counter + 1, b_a_r(List1, Counter1, N, [El|CurList], M, K).

insert(List, Char1, Char2, N1, N2):- insert(Char1, 0, N1, Char2, 0, N2, List).
insert(_, CurN1, N1, _, _, _, _):- CurN1 > N1, !, fail.
insert(_, N1, N1, _, N2, N2, CurList):- write_str(CurList), write("\n"), !, fail.
insert(_, N1, N1, Char2, Counter2, N2, CurList):- in_list_include(Char2, CurList, CurList1), NewCounter2 is Counter2 + 1, insert(_, N1, N1, Char2, NewCounter2, N2, CurList1), !.
insert(Char1, Counter1, N1, Char2, 0, N2, CurList):- in_list_include(Char1, CurList, CurList1), NewCounter1 is Counter1 + 1, insert(Char1, NewCounter1, N1, Char2, 0, N2, CurList1).

write_str([]):-!.
write_str([H|T]):-put(H),write_str(T).
