startAkinator:- readCharacters, question1(Ans1), question2(Ans2), check2(Ans1, Ans2).

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

/*Проверка после первых двух вопросов*/
/*Персонажи в файле расположены след. образом:*/
/*Имя персонажа*/
/*Цифры-ответы*/
check2(Ans1, Ans2):- goodEvilNeutral(Char, Ans1), height(Char, Ans2), write(Char).

read_str(A):-get0(X),r_str(X,A,[]).
r_str(10,A,A):-!.
r_str(X,A,B):-append(B,[X],B1),get0(X1),r_str(X1,A,B1).
