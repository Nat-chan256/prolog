:- dynamic goodEvilNeutral/2, height/2,  height/2, race/2, sex/2, ringOwner/2, isildurRelative/2, diedFromSauron/2, aragornLover/2, old/2, diedInFilm/2, rohanKing/2, foughtSpider/2, usedBow/2, servedDenator/2, denatorsSon/2.

startAkinator:- see('characters.txt'), readCharacter, seen, question1(Ans1), question2(Ans2), check2(Ans1, Ans2).
startAkinator(Ans1, Ans2):- question3(Ans3), check3(Ans1, Ans2, Ans3).
startAkinator(Ans1, Ans2, Ans3):- question4(Ans4), check4(Ans1, Ans2, Ans3, Ans4).
startAkinator(Ans1, Ans2, Ans3, Ans4):- question5(Ans3, Ans4, Ans5), check5(Ans1, Ans2, Ans3, Ans4, Ans5).
startAkinator(Ans1, Ans2, Ans3, Ans4, Ans5):- question6(Ans3, Ans5, Ans6), check6(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6).
startAkinator(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6):- question7(Ans6, Ans7), check7(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6, Ans7).
startAkinator(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6, Ans7):- question8(Ans7, Ans8), check8(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6, Ans7, Ans8).

/*Персонажи в файле расположены след. образом:*/
/*Имя персонажа*/
/*Цифры-ответы*/
readCharacter:-  readln(Character), Character \= -1, readln(Digits), assertGEN(Character, Digits), readCharacter.

assertGEN(_, []):- !.
assertGEN(Character, [H|T]):- asserta(goodEvilNeutral(Character, H)), assertHeight(Character, T).


assertHeight(_, []):- !.
assertHeight(Character, [H|T]):- (height(Character, H)), assertRace(Character, T).

assertRace(_, []):- !.
assertRace(Character, [H|T]):- asserta(race(Character, H)), assertSex(Character, T).

assertSex(_, []):- !.
assertSex(Character, [H|T]):- asserta(sex(Character, H)), assertSex(Character, T).

question1(Answer):- write("На какой стороне сражался Ваш персонаж?"), nl,
    write("0. На стороне добра."), nl,
    write("1. На стороне зла."), nl,
    write("2. Персонаж скорее нейтрален."), nl,
    read(Answer).

question2(Answer):- write("Каков рост Вашего персонажа?"), nl,
    write("0. Ниже человеческого."), nl,
    write("1. Человеческий."), nl,
    write("2. Выше человеческого."), nl,
    read(Answer).

check2(Ans1, Ans2):- goodEvilNeutral(Char, Ans1), height(Char, Ans2), write('Вы загадали '), write_str(Char), write('. Верно?\n0.Да\n1.Нет'), read(Answer), checkUsersAnswer(Answer).
check2(Ans1, Ans2):-startAkinator(Ans1, Ans2).


read_str(A):-get0(X),r_str(X,A,[]).
r_str(10,A,A):-!.
r_str(X,A,B):-append(B,[X],B1),get0(X1),r_str(X1,A,B1).
