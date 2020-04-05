rewriteFile(Path):- see(Path), readAllLines(List), write(List), seen.

readAllLines(ResultList):- readln(CurStr), readAllLines([CurStr], ResultList).
readAllLines([], []):-!.
readAllLines(CurList, ResultList):- readln([]), ResultList = CurList, !.
readAllLines(CurList, ResultList):- readln(NewStr), insert(CurList, NewStr, NewList), readAllLines(NewList, ResultList).

insert([], NewStr, [NewStr]):- !.
insert([H|T], NewStr, ResultList):- numOfConsInStr(NewStr, N1), numOfConsInStr(H, N2), N1 < N2, append([NewStr], [H], TempList), append(TempList, T, ResultList), !.
insert([H|T], NewStr, ResultList):- insert(T, [H], NewStr, ResultList).
insert([], FirstHalf, NewStr, ResultList):- append(FirstHalf, NewStr, ResultList), !.
insert([H|T], FirstHalf, NewStr, ResultList):- numOfConsInStr(NewStr, N1), numOfConsInStr(H, N2), N1 < N2, append(FirstHalf, NewStr, NewFirstHalf), append(NewFirstHalf, [H], TempHead), append(TempHead, T, ResultList), !.
insert([H|T], FirstHalf, NewStr, ResultList):- append(FirstHalf, [H], NewFirstHalf), insert(T, NewFirstHalf, NewStr, ResultList).

numOfConsInStr(Str, N):- numOfConsInStr(Str, 0, N).
numOfConsInStr([], CurN, CurN):- !.
numOfConsInStr([H|T], CurN, N):- numOfConsInWord([H], N1), NewN is CurN + N1, numOfConsInStr(T, NewN, N).

numOfConsInWord(Str, N):- numOfConsInWord(Str, 0, N).
numOfConsInWord([], CurN, CurN):- !.
numOfConsInWord([H|T], CurN, N):- consonant(H), NewN is CurN + 1, numOfConsInWord(T, NewN, N), !.
numOfConsInWord([_|T], CurN, N):- numOfConsInWord(T, CurN, N).

/*Заглавные буквы кириллицы*/
consonant(1041).
consonant(1042).
consonant(1043).
consonant(1044).

consonant(1046).
consonant(1047).

consonant(1049).
consonant(1050).
consonant(1051).
consonant(1052).
consonant(1053).

consonant(1055).
consonant(1056).
consonant(1057).
consonant(1058).

consonant(1060).
consonant(1061).
consonant(1062).
consonant(1063).
consonant(1064).
consonant(1065).

/*Строчные буквы кириллицы*/
consonant(1073).
consonant(1074).
consonant(1075).
consonant(1076).

consonant(1078).
consonant(1079).

consonant(1081).
consonant(1082).
consonant(1083).
consonant(1084).
consonant(1085).

consonant(1087).
consonant(1088).
consonant(1089).
consonant(1090).

consonant(1092).
consonant(1093).
consonant(1094).
consonant(1095).
consonant(1096).
consonant(1097).

/*Заглавные буквы латиницы*/
consonant(66). /*B*/
consonant(67).
consonant(68).

consonant(70). /*F*/
consonant(71).
consonant(72).

consonant(74). /*J*/
consonant(75).
consonant(76).
consonant(77).
consonant(78).

consonant(80). /*P*/
consonant(81).
consonant(82).
consonant(83).
consonant(84).

consonant(86). /*V*/
consonant(87).
consonant(88).
consonant(90).


/*Строчные буквы латиницы*/
consonant(98). /*B*/
consonant(99).
consonant(100).

consonant(102). /*F*/
consonant(103).
consonant(104).

consonant(106). /*J*/
consonant(107).
consonant(108).
consonant(109).
consonant(110).

consonant(112). /*P*/
consonant(113).
consonant(114).
consonant(115).
consonant(116).

consonant(118). /*V*/
consonant(119).
consonant(120).
consonant(122).


