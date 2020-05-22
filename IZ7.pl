:- dynamic goodEvilNeutral/2, race/2, sex/2, ringOwner/2, isildurRelative/2, aragornLover/2, diedInFilm/2, rohanKing/2, usedBow/2, servedDenator/2, denatorsSon/2, reachedRockMountain/2, usedSword/2.

startAkinator:- see('characters.txt'), readCharacter, seen, question1(Ans1), question2(Ans2), question3(Ans3), question4(Ans4), question5(Ans5), question6(Ans6), question7(Ans7), question8(Ans1,Ans2,Ans3,Ans4,Ans5,Ans6,Ans7,Ans8), check(Ans1,Ans2,Ans3,Ans4,Ans5,Ans6,Ans7,Ans8) , !.

/*Персонажи в файле расположены след. образом:*/
/*Имя персонажа*/
/*Цифры-ответы*/
readCharacter:- readln(Character), /*trace,*/ Character \= [],/*nodebug,*/ readln(Digits), /*trace,*/ assertGEN(Character, Digits), /*nodebug,*/ readCharacter.
readCharacter:- !.

/*------------------------------------Ассерты-----------------------------------*/
assertGEN(_, []):- !.
assertGEN(Character, [H|T]):- asserta(goodEvilNeutral(Character, H)), assertRace(Character, T).

assertRace(_, []):- !.
assertRace(Character, [H|T]):- asserta(race(Character, H)), assertIsildurRelative(Character, T).

assertIsildurRelative(_,[]):- !.
assertIsildurRelative(Character,[H|T]):- asserta(isildurRelative(Character,H)), assertSex(Character, T).

assertSex(_, []):- !.
assertSex(Character, [H|T]):- asserta(sex(Character, H)), assertRingOwner(Character, T).

assertRingOwner(_, []):- !.
assertRingOwner(Character, [H|T]):- asserta(ringOwner(Character, H)), assertDiedInFilm(Character, T).

assertDiedInFilm(_, []):- !.
assertDiedInFilm(Character, [H|T]):- asserta(diedInFilm(Character, H)), assertReachedMountain(Character, T).

assertReachedMountain(_, []):- !.
assertReachedMountain(Character,[H|T]):- asserta(reachedRockMountain(Character, H)), race(Character, Race), Race = 3, ringOwner(Character, RingOwner), RingOwner = 1, H = 1, assertServedDenator(Character, T),!.
assertReachedMountain(Character,[_|T]):- diedInFilm(Character, Died), Died = 0, race(Character, Race), Race = 0, assertRohanKing(Character, T),!.
assertReachedMountain(Character,[_|T]):- race(Character, Race), diedInFilm(Character, Died), Race = 0, Died = 1, assertDenatorSon(Character, T),!.
assertReachedMountain(Character,[_|T]):- race(Character, Race), sex(Character, Sex), Race = 1, Sex = 1, assertArogornLover(Character, T),!.
assertReachedMountain(Character,[_|T]):-  race(Character, Race), sex(Character, Sex), Race = 1, Sex = 0, assertUsedBow(Character, T),!.
assertReachedMountain(Character,[_|T]):- assertUsedSword(Character, T).

assertUsedSword(_, []):- !.
assertUsedSword(Character, [H|_]):- asserta(usedSword(Character, H)).

assertArogornLover(_, []):- !.
assertArogornLover(Character, [H|_]):- asserta(aragornLover(Character, H)).

assertUsedBow(_, []):- !.
assertUsedBow(Character, [H|_]):- asserta(usedBow(Character, H)).

assertServedDenator(_, []):- !.
assertServedDenator(Character, [H|_]):- asserta(servedDenator(Character, H)).

assertRohanKing(_, []):- !.
assertRohanKing(Character, [H|_]):- asserta(rohanKing(Character, H)).

assertDenatorSon(_, []):- !.
assertDenatorSon(Character, [H|_]):- asserta(denatorsSon(Character, H)).


/*------------------------------------Вопросы------------------------------------*/
question1(Answer):- write('На какой стороне сражался Ваш персонаж?'), nl,
    write('0. На стороне добра.'), nl,
    write('1. На стороне зла.'), nl,
    write('2. Персонаж скорее нейтрален.'), nl,
    read(Answer).

question2(Answer):- write('Раса Вашего персонажа:'), nl,
    write('0. Человек'), nl,
    write('1. Эльф'), nl,
    write('2. Гном'), nl,
    write('3. Хоббит'), nl,
    write('4. Маг'), nl,
    write('5. Назгул'), nl,
    write('6. Энт'), nl,
    write('7. Другое'), nl,
    read(Answer).

question3(Answer):-  write('Состоит ли Ваш персонаж в родстве с Исилдуром?'), nl,
    write('0. Да'), nl,
    write('1. Нет'), nl,
    read(Answer).

question4(Answer):-  write('Пол Вашего персонажа:'), nl,
    write('0. Мужской'), nl,
    write('1. Женский'), nl,
    read(Answer).

question5(Answer):-  write('Был ли Ваш персонаж владельцем кольца?'), nl,
    write('0. Да'), nl,
    write('1. Нет'), nl,
    read(Answer).

question6(Answer):-  write('Ваш персонаж погиб в фильме?'), nl,
    write('0. Да'), nl,
    write('1. Нет'), nl,
    read(Answer).

question7(Answer):-  write('Дошел ли Ваш персонаж до Роковой Горы?'), nl,
    write('0. Да'), nl,
    write('1. Нет'), nl,
    read(Answer).

question8(_,3,_,_,1,_,1,Answer):- write('Ваш персонаж служил Дэнетору II(правителю Гондора)?'), nl,
    write('0. Да'), nl,
    write('1. Нет'), nl,
    read(Answer),!.
question8(_, 0, _, _, _, 0, _, Answer):- write('Ваш персонаж - король Рохана?'), nl,
    write('0. Да'), nl,
    write('1. Нет'), nl,
    read(Answer), !.
question8(_, 0, _, 0, _, 1, _, Answer):- write('Ваш персонаж - сын Дэнетора II(правителя Гондора)?'), nl,
    write('0. Да'), nl,
    write('1. Нет'), nl,
    read(Answer), !.
question8(_, 1, _, 1, _, _, _, Answer):- write('Ваша героиня вышла замуж за Арагорна?'), nl,
    write('0. Да'), nl,
    write('1. Нет'), nl,
    read(Answer), !.
question8(_, 1, _, 0, _, _, _, Answer):- write('Ваш персонаж использовал лук в качестве основного оружия?'), nl,
    write('0. Да'), nl,
    write('1. Нет'), nl,
    read(Answer), !.
question8(_,_,_,_,_,_,_,Answer):- write('Ваш персонаж использовал меч?'), nl,
    write('0. Да'), nl,
    write('1. Нет'), nl,
    read(Answer), !.

check(Ans1,Ans2,Ans3,Ans4,Ans5,Ans6,Ans7,Ans8):- goodEvilNeutral(Char, Ans1), race(Char, Ans2), isildurRelative(Char, Ans3), sex(Char, Ans4), ringOwner(Char, Ans5), diedInFilm(Char, Ans6), reachedRockMountain(Char, Ans7), (servedDenator(Char, Ans8); rohanKing(Char, Ans8); denatorsSon(Char, Ans8); aragornLover(Char, Ans8); usedBow(Char, Ans8); usedSword(Char, Ans8)), write('Вы загадали '), write_str(Char), deleteFacts,!.
check(Ans1,Ans2,Ans3,Ans4,Ans5,Ans6,Ans7,Ans8):- write('Ваш персонаж не был найден в базе данных. Хотите добавить его?\n0. Да\n1. Нет\n'), read(Answer), checkUsersAnswer(Answer, [Ans1,Ans2,Ans3,Ans4,Ans5,Ans6,Ans7,Ans8]), deleteFacts.

checkUsersAnswer(0, List):- write('Введите имя персонажа: '), read_str(CharName), name(Character, CharName), addCharacter(Character, List), !.
checkUsersAnswer(1, _):- !.

deleteFacts:- deleteGEN, deleteRace, deleteSex, deleteRingOwner, deleteIsildurRelative, deleteAragornLover, deleteDiedInFilm, deleteRohanKing, deleteUsedBow, deleteServedDenator, deleteDenatorsSon, deleteReachedRockMountain, deleteUsedSword.

/*-------------------------------Удаление фактов------------------------------------*/
deleteGEN:-  repeat,(goodEvilNeutral(X,Y) -> retract(goodEvilNeutral(X,Y)), fail;X=nil,Y=nil, !).

deleteRace:- repeat,(race(X,Y) -> retract(race(X,Y)), fail;X=nil,Y=nil, !).

deleteSex:- repeat,(sex(X,Y) -> retract(sex(X,Y)), fail;X=nil,Y=nil, !).

deleteRingOwner:- repeat,(ringOwner(X,Y) -> retract(ringOwner(X,Y)), fail;X=nil,Y=nil, !).

deleteIsildurRelative:- repeat,(isildurRelative(X,Y) -> retract(isildurRelative(X,Y)), fail;X=nil,Y=nil, !).

deleteAragornLover:- repeat,(aragornLover(X,Y) -> retract(aragornLover(X,Y)), fail;X=nil,Y=nil, !).

deleteDiedInFilm:- repeat,(diedInFilm(X,Y) -> retract(diedInFilm(X,Y)), fail;X=nil,Y=nil, !).

deleteRohanKing:- repeat,(rohanKing(X,Y) -> retract(rohanKing(X,Y)), fail;X=nil,Y=nil, !).

deleteUsedBow:- repeat,(usedBow(X,Y) -> retract(usedBow(X,Y)), fail;X=nil,Y=nil, !).

deleteServedDenator:-  repeat,(servedDenator(X,Y) -> retract(servedDenator(X,Y)), fail;X=nil,Y=nil, !).

deleteDenatorsSon:- repeat,(denatorsSon(X,Y) -> retract(denatorsSon(X,Y)), fail;X=nil,Y=nil, !).

deleteReachedRockMountain:- repeat,(reachedRockMountain(X,Y) -> retract(reachedRockMountain(X,Y)), fail;X=nil,Y=nil, !).

deleteUsedSword:- repeat,(usedSword(X,Y) -> retract(usedSword(X,Y)), fail;X=nil,Y=nil, !).

addCharacter(CharName, List):- append('characters.txt'), nl, write(CharName), nl, write_list(List), told.

write_list([]):-!.
write_list([H|T]):- write(H), write(" "), write_list(T).

write_str([]):-!.
write_str([H|T]):- write(H), write(" "), write_str(T).

read_str(A):-get0(X),get0(X1),r_str(X1,A,[]).
r_str(10,A,A):-!.
r_str(X,A,B):-append(B,[X],B1),get0(X1),r_str(X1,A,B1).










