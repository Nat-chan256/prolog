rewriteFile(Path):- see(Path), readAllLines(List), seen, atom_concat('New', Path, NewPath), tell(NewPath), writeStringsFromList(List), told.

readAllLines(ResultList):- readln(CurStr), readAllLines(CurStr, [], ResultList).
readAllLines([], []):-!.
readAllLines([], CurList, CurList):- !.
readAllLines(CurStr, CurList, ResultList):- insert(CurList, CurStr, NewList), readln(NewStr), readAllLines(NewStr, NewList, ResultList).

insert([], NewStr, [NewStr]):- !.
insert([H|T], NewStr, ResultList):- numOfConsInStr(NewStr, N1), numOfConsInStr(H, N2), N1 < N2, append([NewStr], [H], TempList), append(TempList, T, ResultList), !.
insert([H|T], NewStr, ResultList):- insert(T, [H], NewStr, ResultList).
insert([], FirstHalf, NewStr, ResultList):- append(FirstHalf, [NewStr], ResultList), !.
insert([H|T], FirstHalf, NewStr, ResultList):- numOfConsInStr(NewStr, N1), numOfConsInStr(H, N2), N1 < N2, append(FirstHalf, [NewStr], NewFirstHalf), append(NewFirstHalf, [H], TempHead), append(TempHead, T, ResultList), !.
insert([H|T], FirstHalf, NewStr, ResultList):- append(FirstHalf, [H], NewFirstHalf), insert(T, NewFirstHalf, NewStr, ResultList).

numOfConsInStr(Str, N):- numOfConsInStr(Str, 0, N).
numOfConsInStr([], CurN, CurN):- !.
numOfConsInStr([H|T], CurN, N):- numOfConsInWord(H, N1), NewN is CurN + N1, numOfConsInStr(T, NewN, N).

numOfConsInWord(Str, N):- atom_chars(Str, Chars), numOfConsInWord(Chars, 0, N).
numOfConsInWord([], CurN, CurN):- !.
numOfConsInWord([H|T], CurN, N):- consonant(H), NewN is CurN + 1, numOfConsInWord(T, NewN, N), !.
numOfConsInWord([_|T], CurN, N):- numOfConsInWord(T, CurN, N).

writeStringsFromList([]):- !.
writeStringsFromList([H|T]):- write_str(H), write('\n'), writeStringsFromList(T).

write_str([]):-!.
write_str([H|T]):- atom_chars(H, Chars), write_word(Chars), write(' '), write_str(T).

write_word([]):- !.
write_word([H|T]):- put(H), write_word(T).

consonant('Á').
consonant('Â').
consonant('Ã').
consonant('Ä').
consonant('Æ').
consonant('Ç').
consonant('É').
consonant('Ê').
consonant('Ë').
consonant('Ì').
consonant('Í').
consonant('Ï').
consonant('Ð').
consonant('Ñ').
consonant('Ò').
consonant('Ó').
consonant('Ô').
consonant('Õ').
consonant('Ö').
consonant('×').
consonant('Ø').
consonant('Ù').

consonant(á).
consonant(â).
consonant(ã).
consonant(ä).
consonant(æ).
consonant(ç).
consonant(é).
consonant(ê).
consonant(ë).
consonant(ì).
consonant(í).
consonant(ï).
consonant(ð).
consonant(ñ).
consonant(ò).
consonant(ô).
consonant(õ).
consonant(ö).
consonant(÷).
consonant(ø).
consonant(ù).
 
consonant('B').
consonant('C').
consonant('D').
consonant('F').
consonant('G').
consonant('H').
consonant('J'). 
consonant('K').
consonant('L').
consonant('M').
consonant('N').
consonant('P').
consonant('Q').
consonant('R').
consonant('S').
consonant('T').
consonant('V'). 
consonant('W').
consonant('X').
consonant('Z').

consonant(b). 
consonant(c).
consonant(d).
consonant(f).
consonant(g).
consonant(h).
consonant(j).
consonant(k).
consonant(l).
consonant(m).
consonant(n).
consonant(p). 
consonant(q).
consonant(r).
consonant(s).
consonant(t).
consonant(u). 
consonant(v).
consonant(w).
consonant(x).
consonant(z).














