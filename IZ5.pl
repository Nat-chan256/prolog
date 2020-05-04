build_words:- write('¬ведите n'), read(N), write('¬ведите k: '), read(K), write('¬ведите m: '), read(M), tell('file_iz5.txt'), build_all_words(N, M, K), told.

build_all_words(N, M, K):- N1 is N - M, N2 is N1 - K, form_list(List, N2), b_a_w(List, M, K).

form_list(List, N):- build_all_razm([a, b, d, e], N, List).

in_list_include(El, [El|T], [El|Result]):- in_list_include(El, T, Result), !.
in_list_include(El, List, [El|List]).
in_list_include(El, [H|T], [H|Result]):- in_list_include(El, T, Result).
