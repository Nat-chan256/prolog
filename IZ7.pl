:- dynamic goodEvilNeutral/2, height/2,  height/2, race/2, sex/2, ringOwner/2, isildurRelative/2, diedFromSauron/2, aragornLover/2, old/2, diedInFilm/2, rohanKing/2, foughtSpider/2, usedBow/2, servedDenator/2, denatorsSon/2.

startAkinator:- see('characters.txt'), readCharacter, seen, question1(Ans1), question2(Ans2), check2(Ans1, Ans2).
startAkinator(Ans1, Ans2):- question3(Ans3), check3(Ans1, Ans2, Ans3).
startAkinator(Ans1, Ans2, Ans3):- question4(Ans4), check4(Ans1, Ans2, Ans3, Ans4).
startAkinator(Ans1, Ans2, Ans3, Ans4):- question5(Ans3, Ans4, Ans5), check5(Ans1, Ans2, Ans3, Ans4, Ans5).
startAkinator(Ans1, Ans2, Ans3, Ans4, Ans5):- question6(Ans3, Ans5, Ans6), check6(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6).
startAkinator(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6):- question7(Ans3, Ans6, Ans7), check7(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6, Ans7).
startAkinator(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6, Ans7):- question8(Ans7, Ans8), check8(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6, Ans7, Ans8).

/*Персонажи в файле расположены след. образом:*/
/*Имя персонажа*/
/*Цифры-ответы*/
readCharacter:- readln(Character), Character \= [], readln(Digits), assertGEN(Character, Digits), readCharacter.
readCharacter:- !.

/*------------------------------------Ассерты-----------------------------------*/
assertGEN(_, []):- !.
assertGEN(Character, [H|T]):- asserta(goodEvilNeutral(Character, H)), assertHeight(Character, T).

assertHeight(_, []):- !.
assertHeight(Character, [H|T]):- asserta(height(Character, H)), assertRace(Character, T).

assertRace(_, []):- !.
assertRace(Character, [H|T]):- asserta(race(Character, H)), assertSex(Character, T).

assertSex(_, []):- !.
assertSex(Character, [H|T]):- asserta(sex(Character, H)), race(Character, Race), Race = 1, H = 1, assertArogornLover(Character, T), !.
assertSex(Character, [_|T]):- assertRingOwner(Character, T).

assertArogornLover(_, []):- !.
assertArogornLover(Character, [H|_]):- asserta(aragornLover(Character, H)).

assertRingOwner(_, []):- !.
assertRingOwner(Character, [H|T]):- asserta(ringOwner(Character, H)), H = 0, assertOld(Character, T), !.
assertRingOwner(Character, [_|T]):- race(Character, Race), Race = 1, assertUsedBow(Character, T), !.
assertRingOwner(Character, [_|T]):- race(Character, Race), Race = 3, assertFoughtSpider(Character, T),!.
assertRingOwner(Character, [_|T]):- assertIsildurRelative(Character, T).

assertOld(_, []):- !.
assertOld(Character, [H|_]):- asserta(old(Character, H)).

assertUsedBow(_, []):- !.
assertUsedBow(Character, [H|_]):- asserta(usedBow(Character, H)).

assertFoughtSpider(_,[]):- !.
assertFoughtSpider(Character, [H|T]):- asserta(foughtSpider(Character, H)), H = 1,assertServedDenator(Character, T).

assertServedDenator(_, []):- !.
assertServedDenator(Character, [H|_]):- asserta(servedDenator(Character, H)).

assertIsildurRelative(_,[]):- !.
assertIsildurRelative(Character,[H|T]):- asserta(isildurRelative(Character,H)), H = 0, assertDiedSauron(Character, T), !.
assertIsildurRelative(Character,[_|T]):- assertDiedInFilm(Character, T).

assertDiedSauron(_, []):- !.
assertDiedSauron(Character, [H|_]):- asserta(diedFromSauron(Character, H)).

assertDiedInFilm(_, []):- !.
assertDiedInFilm(Character, [H|T]):- asserta(diedInFilm(Character, H)), H = 0, assertRohanKing(Character, T), !.
assertDiedInFilm(Character, [_|T]):- assertDenatorSon(Character, T).

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

question2(Answer):- write('Каков рост Вашего персонажа?'), nl,
    write('0. Ниже человеческого.'), nl,
    write('1. Человеческий.'), nl,
    write('2. Выше человеческого.'), nl,
    read(Answer).

question3(Answer):- write('Раса Вашего персонажа:'), nl,
    write('0. Человек'), nl,
    write('1. Эльф'), nl,
    write('2. Гном'), nl,
    write('3. Хоббит'), nl,
    write('4. Маг'), nl,
    write('5. Назгул'), nl,
    read(Answer).

question4(Answer):-  write('Пол Вашего персонажа:'), nl,
    write('0. Мужской'), nl,
    write('1. Женский'), nl,
    read(Answer).

question5(1, 1, Answer):- write('Ваш персонаж - возлюбленная Арагорна?'), nl,
    write('0. Да'), nl,
    write('1. Нет'), nl,
    read(Answer), !.
question5(_, _, Answer):- write('Был ли Ваш персонаж владельцем кольца?'), nl,
    write('0. Да'), nl,
    write('1. Нет'), nl,
    read(Answer).

question6(3, 0, Answer):-  write('Ваш персонаж'), nl,
    write('0. Стар'), nl,
    write('1. Молод'), nl,
    read(Answer), !.
question6(3, 1, Answer):-  write('Сражался ли Ваш персонаж с пауком?'), nl,
    write('0. Да'), nl,
    write('1. Нет'), nl,
    read(Answer), !.
question6(1, 1, Answer):-  write('Использовал ли Ваш персонаж лук в качестве основного оружия'), nl,
    write('0. Да'), nl,
    write('1. Нет'), nl,
    read(Answer), !.
question6(_, _, Answer):-  write('Состоит ли Ваш персонаж в родстве с Исилдуром?'), nl,
    write('0. Да'), nl,
    write('1. Нет'), nl,
    read(Answer).

question7(3, 1, Answer):-  write('Ваш персонаж служил Дэнетору II(правителю Гондора)?'), nl,
    write('0. Да'), nl,
    write('1. Нет'), nl,
    read(Answer),!.
question7(_, 0, Answer):-  write('Ваш персонаж погиб от рук Саурона?'), nl,
    write('0. Да'), nl,
    write('1. Нет'), nl,
    read(Answer),!.
question7(_, _, Answer):-  write('Ваш персонаж погиб в фильме?'), nl,
    write('0. Да'), nl,
    write('1. Нет'), nl,
    read(Answer).

question8(0, Answer):- write('Ваш персонаж - король Рохана?'), nl,
    write('0. Да'), nl,
    write('1. Нет'), nl,
    read(Answer), !.
question8(1, Answer):- write('Ваш персонаж - сын Дэнетора II(правителя Гондора)?'), nl,
    write('0. Да'), nl,
    write('1. Нет'), nl,
    read(Answer), !.

check2(Ans1, Ans2):- goodEvilNeutral(Char, Ans1), height(Char, Ans2), write('Вы загадали '), write_list(Char), write('. Верно?\n0.Да\n1.Нет'), read(Answer), checkUsersAnswer(Answer, [Ans1, Ans2]), !.
check2(Ans1, Ans2):-startAkinator(Ans1, Ans2).

check3(Ans1, Ans2, Ans3):-  goodEvilNeutral(Char, Ans1), height(Char, Ans2), race(Char, Ans3), write('Вы загадали '), write_str(Char), write('. Верно?\n0.Да\n1.Нет'), read(Answer), checkUsersAnswer(Answer, [Ans1, Ans2, Ans3]), !.
check3(Ans1, Ans2, Ans3):-startAkinator(Ans1, Ans2, Ans3).

check4(Ans1, Ans2, Ans3, Ans4):- goodEvilNeutral(Char, Ans1), height(Char, Ans2), race(Char, Ans3), sex(Char, Ans4), write('Вы загадали '), write_str(Char), write('. Верно?\n0.Да\n1.Нет'), read(Answer), checkUsersAnswer(Answer, [Ans1, Ans2, Ans3, Ans4]), !.
check4(Ans1, Ans2, Ans3, Ans4):-startAkinator(Ans1, Ans2, Ans3, Ans4).

check5(Ans1, Ans2, Ans3, Ans4, Ans5):-  goodEvilNeutral(Char, Ans1), height(Char, Ans2), race(Char, Ans3), sex(Char, Ans4), aragornLover(Char, Ans5),  write('Вы загадали '), write_str(Char), write('. Верно?\n0.Да\n1.Нет'), read(Answer), checkUsersAnswer(Answer, [Ans1, Ans2, Ans3, Ans4, Ans5]), !.
check5(Ans1, Ans2, Ans3, Ans4, Ans5):-  goodEvilNeutral(Char, Ans1), height(Char, Ans2), race(Char, Ans3), sex(Char, Ans4), ringOwner(Char, Ans5),  write('Вы загадали '), write_str(Char), write('. Верно?\n0.Да\n1.Нет'), read(Answer), checkUsersAnswer(Answer, [Ans1, Ans2, Ans3, Ans4, Ans5]), !.
check5(Ans1, Ans2, Ans3, Ans4, Ans5):-startAkinator(Ans1, Ans2, Ans3, Ans4, Ans5).

check6(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6):- goodEvilNeutral(Char, Ans1), height(Char, Ans2), race(Char, Ans3), sex(Char, Ans4), ringOwner(Char, Ans5), old(Char, Ans6), write('Вы загадали '), write_str(Char), write('. Верно?\n0.Да\n1.Нет'), read(Answer), checkUsersAnswer(Answer, [Ans1, Ans2, Ans3, Ans4, Ans5, Ans6]), !.
check6(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6):- goodEvilNeutral(Char, Ans1), height(Char, Ans2), race(Char, Ans3), sex(Char, Ans4), ringOwner(Char, Ans5), foughtSpider(Char, Ans6), write('Вы загадали '), write_str(Char), write('. Верно?\n0.Да\n1.Нет'), read(Answer), checkUsersAnswer(Answer, [Ans1, Ans2, Ans3, Ans4, Ans5, Ans6]), !.
check6(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6):- goodEvilNeutral(Char, Ans1), height(Char, Ans2), race(Char, Ans3), sex(Char, Ans4), ringOwner(Char, Ans5), usedBow(Char, Ans6), write('Вы загадали '), write_str(Char), write('. Верно?\n0.Да\n1.Нет'), read(Answer), checkUsersAnswer(Answer, [Ans1, Ans2, Ans3, Ans4, Ans5, Ans6]), !.
check6(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6):- goodEvilNeutral(Char, Ans1), height(Char, Ans2), race(Char, Ans3), sex(Char, Ans4), ringOwner(Char, Ans5), isildurRelative(Char, Ans6), write('Вы загадали '), write_str(Char), write('. Верно?\n0.Да\n1.Нет'), read(Answer), checkUsersAnswer(Answer, [Ans1, Ans2, Ans3, Ans4, Ans5, Ans6]), !.
check6(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6):-startAkinator(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6).

check7(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6, Ans7):- goodEvilNeutral(Char, Ans1), height(Char, Ans2), race(Char, Ans3), sex(Char, Ans4), ringOwner(Char, Ans5), foughtSpider(Char, Ans6), servedDenator(Char, Ans7),  write('Вы загадали '), write_str(Char), write('. Верно?\n0.Да\n1.Нет'), read(Answer), checkUsersAnswer(Answer, [Ans1, Ans2, Ans3, Ans4, Ans5, Ans6, Ans7]), !.
check7(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6, Ans7):- goodEvilNeutral(Char, Ans1), height(Char, Ans2), race(Char, Ans3), sex(Char, Ans4), ringOwner(Char, Ans5), isildurRelative(Char, Ans6), diedFromSauron(Char, Ans7),  write('Вы загадали '), write_str(Char), write('. Верно?\n0.Да\n1.Нет'), read(Answer), checkUsersAnswer(Answer, [Ans1, Ans2, Ans3, Ans4, Ans5, Ans6, Ans7]), !.
check7(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6, Ans7):-startAkinator(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6, Ans7).

check8(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6, Ans7, Ans8):-  goodEvilNeutral(Char, Ans1), height(Char, Ans2), race(Char, Ans3), sex(Char, Ans4), ringOwner(Char, Ans5), isildurRelative(Char, Ans6), diedInFilm(Char, Ans7), denatorsSon(Char, Ans8), write('Вы загадали '), write_str(Char), write('. Верно?\n0.Да\n1.Нет'), read(Answer), checkUsersAnswer(Answer, [Ans1, Ans2, Ans3, Ans4, Ans5, Ans6, Ans7, Ans8]).

/*Проверка, правильно ли отгадан персонаж*/
checkUsersAnswer(0, _):- trace, deleteFacts, !.
checkUsersAnswer(1, List):- write('Хотите добавить персонажа?\n0.Да\n1.Нет'), read(Answer), Answer = 0, write('Введите имя персонажа: '), read_str(CharName), addCharacter(CharName, List).

deleteFacts:- deleteGEN, deleteHeight, deleteRace, deleteSex, deleteRingOwner, deleteIsildurRelative, deleteDiedFromSauron, deleteAragornLover, deleteOld, deleteDiedInFilm, deleteRohanKing, deleteFoughtSpider, deleteUsedBow, deleteServedDenator, deleteDenatorsSon.

/*-------------------------------Удаление фактов------------------------------------*/
/*deleteGEN:- goodEvilNeutral(X,Y), deleteGEN(X,Y).
deleteGEN(X,Y):- retract(goodEvilNeutral(X,Y)), repeat,
(goodEvilNeutral(X1,Y1) ->
retract(goodEvilNeutral(X1,Y1));X1=nil,Y1=nil).*/

deleteGEN:-  repeat,(goodEvilNeutral(X1,Y1) -> retract(goodEvilNeutral(X1,Y1)), fail;X1=nil,Y1=nil, !).

deleteHeight:- height(X,Y), deleteHeight(X,Y).
deleteHeight(X,Y):- repeat, (height(X,Y) -> retract(height(X,Y));X=nil,Y=nil).

deleteRace:- race(X,Y), deleteRace(X,Y).
deleteRace(X,Y):- repeat, (race(X,Y) -> retract(race(X,Y));X=nil,Y=nil).

deleteSex:- sex(X,Y), deleteSex(X,Y).
deleteSex(X,Y):- repeat, (sex(X,Y) -> retract(sex(X,Y));X=nil,Y=nil).

deleteRingOwner:- ringOwner(X,Y), deleteRingOwner(X,Y).
deleteRingOwner(X,Y):- repeat, (ringOwner(X,Y) -> retract(ringOwner(X,Y));X=nil,Y=nil).

deleteIsildurRelative:- isildurRelative(X,Y), deleteIsildurRelative(X,Y).
deleteIsildurRelative(X,Y):- repeat, (isildurRelative(X,Y) -> retract(isildurRelative(X,Y));X=nil,Y=nil).

deleteDiedFromSauron:- diedFromSauron(X,Y), deleteDiedFromSauron(X,Y).
deleteDiedFromSauron(X,Y):- repeat, (diedFromSauron(X,Y) -> retract(diedFromSauron(X,Y));X=nil,Y=nil).

deleteAragornLover:- aragornLover(X,Y), deleteAragornLover(X,Y).
deleteAragornLover(X,Y):- repeat, (aragornLover(X,Y) -> retract(aragornLover(X,Y));X=nil,Y=nil).

deleteOld:- old(X,Y), deleteOld(X,Y).
deleteOld(X,Y):- repeat, (old(X,Y) -> retract(old(X,Y));X=nil,Y=nil).

deleteDiedInFilm:- diedInFilm(X,Y), deleteDiedInFilm(X,Y).
deleteDiedInFilm(X,Y):- repeat, (diedInFilm(X,Y) -> retract(diedInFilm(X,Y));X=nil,Y=nil).

deleteRohanKing:- rohanKing(X,Y), deleteRohanKing(X,Y).
deleteRohanKing(X,Y):- repeat, (rohanKing(X,Y) -> retract(rohanKing(X,Y));X=nil,Y=nil).

deleteFoughtSpider:- foughtSpider(X,Y), deleteFoughtSpider(X,Y).
deleteFoughtSpider(X,Y):- repeat, (foughtSpider(X,Y) -> retract(foughtSpider(X,Y));X=nil,Y=nil).

deleteUsedBow:- usedBow(X,Y), deleteUsedBow(X,Y).
deleteUsedBow(X,Y):- repeat, (usedBow(X,Y) -> retract(usedBow(X,Y));X=nil,Y=nil).

deleteServedDenator:- servedDenator(X,Y), deleteServedDenator(X,Y).
deleteServedDenator(X,Y):- repeat, (servedDenator(X,Y) -> retract(servedDenator(X,Y));X=nil,Y=nil).

deleteDenatorsSon:- denatorsSon(X,Y), deleteDenatorsSon(X,Y).
deleteDenatorsSon(X,Y):- repeat, (denatorsSon(X,Y) -> retract(denatorsSon(X,Y));X=nil,Y=nil).

addCharacter(CharName, List):- nl, append('characters.txt'), write(CharName), nl, write_list(List).

write_list([]):-!.
write_list([H|T]):- write(H), write(" "), write_list(T).

write_str([]):-!.
write_str([H|T]):- put(H), write_str(T).

read_str(A):-get0(X),r_str(X,A,[]).
r_str(10,A,A):-!.
r_str(X,A,B):-append(B,[X],B1),get0(X1),r_str(X1,A,B1).






