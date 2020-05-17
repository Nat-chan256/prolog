:- dynamic goodEvilNeutral/2, height/2,  height/2, race/2, sex/2, ringOwner/2, isildurRelative/2, diedFromSauron/2, aragornLover/2, old/2, diedInFilm/2, rohanKing/2, foughtSpider/2, usedBow/2, servedDenator/2, denatorsSon/2.

startAkinator:- see('characters.txt'), readCharacter, seen, question1(Ans1), question2(Ans2), question3(Ans3), question4(Ans4), question5(Ans5), question6(Ans3, Ans4, Ans5, Ans6), check6(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6), !.
/*startAkinator(Ans1, Ans2):- question3(Ans3), check3(Ans1, Ans2, Ans3).*/
/*startAkinator(Ans1, Ans2, Ans3):- question4(Ans4), check4(Ans1, Ans2, Ans3, Ans4).*/
/*startAkinator(Ans1, Ans2, Ans3, Ans4):- question5(Ans3, Ans4, Ans5), check5(Ans1, Ans2, Ans3, Ans4, Ans5).*/
/*startAkinator(Ans1, Ans2, Ans3, Ans4, Ans5):- question6(Ans3, Ans5, Ans6), check6(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6).*/
startAkinator(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6):- question7(Ans3, Ans6, Ans7), check7(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6, Ans7).
startAkinator(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6, Ans7):- question8(Ans3, Ans7, Ans8), check8(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6, Ans7, Ans8).

/*Персонажи в файле расположены след. образом:*/
/*Имя персонажа*/
/*Цифры-ответы*/
readCharacter:- readln(Character), /*trace,*/ Character \= [],/*nodebug,*/ readln(Digits), /*trace,*/ assertGEN(Character, Digits), /*nodebug,*/ readCharacter.
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
    write('6. Энт'), nl,
    read(Answer).

question4(Answer):-  write('Состоит ли Ваш персонаж в родстве с Исилдуром?'), nl,
    write('0. Да'), nl,
    write('1. Нет'), nl,
    read(Answer).

question5(Answer):-  write('Пол Вашего персонажа:'), nl,
    write('0. Мужской'), nl,
    write('1. Женский'), nl,
    read(Answer).

question6(1,1,1,Answer):- write('Ваш персонаж - возлюбленная Арагорна?'), nl,
    write('0. Да'), nl,
    write('1. Нет'), nl,
    read(Answer), !.
question6(1,1,0, Answer):-  write('Использовал ли Ваш персонаж лук в качестве основного оружия'), nl,
    write('0. Да'), nl,
    write('1. Нет'), nl,
    read(Answer), !.
question6(0,0,0,Answer):-  write('Ваш персонаж погиб от рук Саурона?'), nl,
    write('0. Да'), nl,
    write('1. Нет'), nl,
    read(Answer),!.
question6(_,_,_,Answer):-  write('Был ли Ваш персонаж владельцем кольца?'), nl,
    write('0. Да'), nl,
    write('1. Нет'), nl,
    read(Answer).

question7(3,0,Answer):-  write('Ваш персонаж'), nl,
    write('0. Стар'), nl,
    write('1. Молод'), nl,
    read(Answer), !.
question7(3,1,Answer):-  write('Сражался ли Ваш персонаж с пауком?'), nl,
    write('0. Да'), nl,
    write('1. Нет'), nl,
    read(Answer), !.
question7(_, _, Answer):-  write('Ваш персонаж погиб в фильме?'), nl,
    write('0. Да'), nl,
    write('1. Нет'), nl,
    read(Answer).

question8(3,1,Answer):- write('Ваш персонаж служил Дэнетору II(правителю Гондора)?'), nl,
    write('0. Да'), nl,
    write('1. Нет'), nl,
    read(Answer),!.
question8(0, 0, Answer):- write('Ваш персонаж - король Рохана?'), nl,
    write('0. Да'), nl,
    write('1. Нет'), nl,
    read(Answer), !.
question8(0, 1, Answer):- write('Ваш персонаж - сын Дэнетора II(правителя Гондора)?'), nl,
    write('0. Да'), nl,
    write('1. Нет'), nl,
    read(Answer), !.

check2(Ans1, Ans2):- goodEvilNeutral(Char, Ans1), height(Char, Ans2), write('Вы загадали '), write_list(Char), deleteFacts, !.
check2(Ans1, Ans2):-startAkinator(Ans1, Ans2).

check3(Ans1, Ans2, Ans3):-  goodEvilNeutral(Char, Ans1), height(Char, Ans2), race(Char, Ans3), write('Вы загадали '), write_str(Char), deleteFacts, !.
check3(Ans1, Ans2, Ans3):-startAkinator(Ans1, Ans2, Ans3).

check4(Ans1, Ans2, Ans3, Ans4):- goodEvilNeutral(Char, Ans1), height(Char, Ans2), race(Char, Ans3), sex(Char, Ans4), write('Вы загадали '), write_str(Char), deleteFacts, !.
check4(Ans1, Ans2, Ans3, Ans4):-startAkinator(Ans1, Ans2, Ans3, Ans4).

check5(Ans1, Ans2, Ans3, Ans4, Ans5):-  goodEvilNeutral(Char, Ans1), height(Char, Ans2), race(Char, Ans3), sex(Char, Ans4), aragornLover(Char, Ans5),  write('Вы загадали '), write_str(Char), deleteFacts, !.
check5(Ans1, Ans2, Ans3, Ans4, Ans5):-  goodEvilNeutral(Char, Ans1), height(Char, Ans2), race(Char, Ans3), sex(Char, Ans4), ringOwner(Char, Ans5),  write('Вы загадали '), write_str(Char), deleteFacts, !.
check5(Ans1, Ans2, Ans3, Ans4, Ans5):-startAkinator(Ans1, Ans2, Ans3, Ans4, Ans5).

check6(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6):- goodEvilNeutral(Char, Ans1), height(Char, Ans2), race(Char, Ans3), sex(Char, Ans4), ringOwner(Char, Ans5), old(Char, Ans6), write('Вы загадали '), write_str(Char), deleteFacts, !.
check6(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6):- goodEvilNeutral(Char, Ans1), height(Char, Ans2), race(Char, Ans3), sex(Char, Ans4), ringOwner(Char, Ans5), foughtSpider(Char, Ans6), write('Вы загадали '), write_str(Char), deleteFacts,!.
check6(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6):- goodEvilNeutral(Char, Ans1), height(Char, Ans2), race(Char, Ans3), sex(Char, Ans4), ringOwner(Char, Ans5), usedBow(Char, Ans6), write('Вы загадали '), write_str(Char), deleteFacts, !.
check6(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6):- goodEvilNeutral(Char, Ans1), height(Char, Ans2), race(Char, Ans3), sex(Char, Ans4), ringOwner(Char, Ans5), isildurRelative(Char, Ans6), write('Вы загадали '), write_str(Char), deleteFacts, !.
check6(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6):-startAkinator(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6).

check7(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6, Ans7):- goodEvilNeutral(Char, Ans1), height(Char, Ans2), race(Char, Ans3), sex(Char, Ans4), ringOwner(Char, Ans5), foughtSpider(Char, Ans6), servedDenator(Char, Ans7),  write('Вы загадали '), write_str(Char), deleteFacts, !.
check7(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6, Ans7):- goodEvilNeutral(Char, Ans1), height(Char, Ans2), race(Char, Ans3), sex(Char, Ans4), ringOwner(Char, Ans5), isildurRelative(Char, Ans6), diedFromSauron(Char, Ans7),  write('Вы загадали '), write_str(Char), deleteFacts, !.
check7(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6, Ans7):-startAkinator(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6, Ans7).

check8(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6, Ans7, Ans8):-  goodEvilNeutral(Char, Ans1), height(Char, Ans2), race(Char, Ans3), sex(Char, Ans4), ringOwner(Char, Ans5), isildurRelative(Char, Ans6), diedInFilm(Char, Ans7), denatorsSon(Char, Ans8), write('Вы загадали '), write_str(Char), deleteFacts, !.
check8(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6, Ans7, Ans8):- write("Персонаж не был найден в базе данных.Хотите его добавить?"), nl, write("0. Да\n1.Нет\n"), read(Answer), checkUsersAnswer(Answer, [Ans1, Ans2, Ans3, Ans4, Ans5, Ans6, Ans7, Ans8]).

checkUsersAnswer(0, List):- write('Введите имя персонажа: '), read_str(CharName), name(Character, CharName), addCharacter(Character, List), !.
checkUsersAnswer(1, _):- !.

deleteFacts:- deleteGEN, deleteHeight, deleteRace, deleteSex, deleteRingOwner, deleteIsildurRelative, deleteDiedFromSauron, deleteAragornLover, deleteOld, deleteDiedInFilm, deleteRohanKing, deleteFoughtSpider, deleteUsedBow, deleteServedDenator, deleteDenatorsSon.

/*-------------------------------Удаление фактов------------------------------------*/
deleteGEN:-  repeat,(goodEvilNeutral(X,Y) -> retract(goodEvilNeutral(X,Y)), fail;X=nil,Y=nil, !).

deleteHeight:-  repeat,(height(X,Y) -> retract(height(X,Y)), fail;X=nil,Y=nil, !).

deleteRace:- repeat,(race(X,Y) -> retract(race(X,Y)), fail;X=nil,Y=nil, !).

deleteSex:- repeat,(sex(X,Y) -> retract(sex(X,Y)), fail;X=nil,Y=nil, !).

deleteRingOwner:- repeat,(ringOwner(X,Y) -> retract(ringOwner(X,Y)), fail;X=nil,Y=nil, !).

deleteIsildurRelative:- repeat,(isildurRelative(X,Y) -> retract(isildurRelative(X,Y)), fail;X=nil,Y=nil, !).

deleteDiedFromSauron:- repeat,(diedFromSauron(X,Y) -> retract(diedFromSauron(X,Y)), fail;X=nil,Y=nil, !).

deleteAragornLover:- repeat,(aragornLover(X,Y) -> retract(aragornLover(X,Y)), fail;X=nil,Y=nil, !).

deleteOld:-  repeat,(old(X,Y) -> retract(old(X,Y)), fail;X=nil,Y=nil, !).

deleteDiedInFilm:- repeat,(diedInFilm(X,Y) -> retract(diedInFilm(X,Y)), fail;X=nil,Y=nil, !).

deleteRohanKing:- repeat,(rohanKing(X,Y) -> retract(rohanKing(X,Y)), fail;X=nil,Y=nil, !).

deleteFoughtSpider:- repeat,(foughtSpider(X,Y) -> retract(foughtSpider(X,Y)), fail;X=nil,Y=nil, !).

deleteUsedBow:- repeat,(usedBow(X,Y) -> retract(usedBow(X,Y)), fail;X=nil,Y=nil, !).

deleteServedDenator:-  repeat,(servedDenator(X,Y) -> retract(servedDenator(X,Y)), fail;X=nil,Y=nil, !).

deleteDenatorsSon:- repeat,(denatorsSon(X,Y) -> retract(denatorsSon(X,Y)), fail;X=nil,Y=nil, !).

addCharacter(CharName, List):- append('characters.txt'), nl, write(CharName), nl, write_list(List), told.

write_list([]):-!.
write_list([H|T]):- write(H), write(" "), write_list(T).

write_str([]):-!.
write_str([H|T]):- write(H), write_str(T).

read_str(A):-get0(X),get0(X1),r_str(X1,A,[]).
r_str(10,A,A):-!.
r_str(X,A,B):-append(B,[X],B1),get0(X1),r_str(X1,A,B1).










