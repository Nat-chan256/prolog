:- dynamic goodEvilNeutral/2, height/2,  height/2, race/2, sex/2, ringOwner/2, isildurRelative/2, diedFromSauron/2, aragornLover/2, old/2, diedInFilm/2, rohanKing/2, foughtSpider/2, usedBow/2, servedDenator/2, denatorsSon/2.

startAkinator:- see('characters.txt'), readCharacter, seen, question1(Ans1), question2(Ans2), check2(Ans1, Ans2).
startAkinator(Ans1, Ans2):- question3(Ans3), check3(Ans1, Ans2, Ans3).
startAkinator(Ans1, Ans2, Ans3):- question4(Ans4), check4(Ans1, Ans2, Ans3, Ans4).
startAkinator(Ans1, Ans2, Ans3, Ans4):- question5(Ans3, Ans4, Ans5), check5(Ans1, Ans2, Ans3, Ans4, Ans5).
startAkinator(Ans1, Ans2, Ans3, Ans4, Ans5):- question6(Ans3, Ans5, Ans6), check6(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6).
startAkinator(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6):- question7(Ans3, Ans6, Ans7), check7(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6, Ans7).
startAkinator(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6, Ans7):- question8(Ans7, Ans8), check8(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6, Ans7, Ans8).

/*��������� � ����� ����������� ����. �������:*/
/*��� ���������*/
/*�����-������*/
readCharacter:-  readln(Character), Character \= -1, readln(Digits), assertGEN(Character, Digits), readCharacter.

/*------------------------------------�������-----------------------------------*/
assertGEN(_, []):- !.
assertGEN(Character, [H|T]):- asserta(goodEvilNeutral(Character, H)), assertHeight(Character, T).

assertHeight(_, []):- !.
assertHeight(Character, [H|T]):- (height(Character, H)), assertRace(Character, T).

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


/*------------------------------------�������------------------------------------*/
question1(Answer):- write('�� ����� ������� �������� ��� ��������?'), nl,
    write('0. �� ������� �����.'), nl,
    write('1. �� ������� ���.'), nl,
    write('2. �������� ������ ���������.'), nl,
    read(Answer).

question2(Answer):- write('����� ���� ������ ���������?'), nl,
    write('0. ���� �������������.'), nl,
    write('1. ������������.'), nl,
    write('2. ���� �������������.'), nl,
    read(Answer).

question3(Answer):- write('���� ������ ���������:'), nl,
    write('0. �������'), nl,
    write('1. ����'), nl,
    write('2. ����'), nl,
    write('3. ������'), nl,
    write('4. ���'), nl,
    write('5. ������'), nl,
    read(Answer).

question4(Answer):-  write('��� ������ ���������:'), nl,
    write('0. �������'), nl,
    write('1. �������'), nl,
    read(Answer).

question5(1, 1, Answer):- write('��� �������� - ������������ ��������?'), nl,
    write('0. ��'), nl,
    write('1. ���'), nl,
    read(Answer), !.
question5(_, _, Answer):- write('��� �� ��� �������� ���������� ������?'), nl,
    write('0. ��'), nl,
    write('1. ���'), nl,
    read(Answer).

question6(3, 0, Answer):-  write('��� ��������'), nl,
    write('0. ����'), nl,
    write('1. �����'), nl,
    read(Answer), !.
question6(3, 1, Answer):-  write('�������� �� ��� �������� � ������?'), nl,
    write('0. ��'), nl,
    write('1. ���'), nl,
    read(Answer), !.
question6(1, 1, Answer):-  write('����������� �� ��� �������� ��� � �������� ��������� ������'), nl,
    write('0. ��'), nl,
    write('1. ���'), nl,
    read(Answer), !.
question6(_, _, Answer):-  write('������� �� ��� �������� � ������� � ���������?'), nl,
    write('0. ��'), nl,
    write('1. ���'), nl,
    read(Answer).

question7(3, 1, Answer):-  write('��� �������� ������ �������� II(��������� �������)?'), nl,
    write('0. ��'), nl,
    write('1. ���'), nl,
    read(Answer),!.
question7(_, 0, Answer):-  write('��� �������� ����� �� ��� �������?'), nl,
    write('0. ��'), nl,
    write('1. ���'), nl,
    read(Answer),!.
question7(_, _, Answer):-  write('��� �������� ����� � ������?'), nl,
    write('0. ��'), nl,
    write('1. ���'), nl,
    read(Answer).

question8(0, Answer):- write('��� �������� - ������ ������?'), nl,
    write('0. ��'), nl,
    write('1. ���'), nl,
    read(Answer), !.
question8(1, Answer):- write('��� �������� - ��� �������� II(��������� �������)?'), nl,
    write('0. ��'), nl,
    write('1. ���'), nl,
    read(Answer), !.

check2(Ans1, Ans2):- goodEvilNeutral(Char, Ans1), height(Char, Ans2), write('�� �������� '), write_str(Char), write('. �����?\n0.��\n1.���'), read(Answer), checkUsersAnswer(Answer, [Ans1, Ans2]), !.
check2(Ans1, Ans2):-startAkinator(Ans1, Ans2).

check3(Ans1, Ans2, Ans3):-  goodEvilNeutral(Char, Ans1), height(Char, Ans2), race(Char, Ans3), write('�� �������� '), write_str(Char), write('. �����?\n0.��\n1.���'), read(Answer), checkUsersAnswer(Answer, [Ans1, Ans2, Ans3]), !.
check3(Ans1, Ans2, Ans3):-startAkinator(Ans1, Ans2, Ans3).

check4(Ans1, Ans2, Ans3, Ans4):- goodEvilNeutral(Char, Ans1), height(Char, Ans2), race(Char, Ans3), sex(Char, Ans4), write('�� �������� '), write_str(Char), write('. �����?\n0.��\n1.���'), read(Answer), checkUsersAnswer(Answer, [Ans1, Ans2, Ans3, Ans4]), !.
check4(Ans1, Ans2, Ans3, Ans4):-startAkinator(Ans1, Ans2, Ans3, Ans4).

check5(Ans1, Ans2, Ans3, Ans4, Ans5):-  goodEvilNeutral(Char, Ans1), height(Char, Ans2), race(Char, Ans3), sex(Char, Ans4), aragornLover(Char, Ans5),  write('�� �������� '), write_str(Char), write('. �����?\n0.��\n1.���'), read(Answer), checkUsersAnswer(Answer, [Ans1, Ans2, Ans3, Ans4, Ans5]), !.
check5(Ans1, Ans2, Ans3, Ans4, Ans5):-  goodEvilNeutral(Char, Ans1), height(Char, Ans2), race(Char, Ans3), sex(Char, Ans4), ringOwner(Char, Ans5),  write('�� �������� '), write_str(Char), write('. �����?\n0.��\n1.���'), read(Answer), checkUsersAnswer(Answer, [Ans1, Ans2, Ans3, Ans4, Ans5]), !.
check5(Ans1, Ans2, Ans3, Ans4, Ans5):-startAkinator(Ans1, Ans2, Ans3, Ans4, Ans5).

check6(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6):- goodEvilNeutral(Char, Ans1), height(Char, Ans2), race(Char, Ans3), sex(Char, Ans4), ringOwner(Char, Ans5), old(Char, Ans6), write('�� �������� '), write_str(Char), write('. �����?\n0.��\n1.���'), read(Answer), checkUsersAnswer(Answer, [Ans1, Ans2, Ans3, Ans4, Ans5, Ans6]), !.
check6(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6):- goodEvilNeutral(Char, Ans1), height(Char, Ans2), race(Char, Ans3), sex(Char, Ans4), ringOwner(Char, Ans5), foughtSpider(Char, Ans6), write('�� �������� '), write_str(Char), write('. �����?\n0.��\n1.���'), read(Answer), checkUsersAnswer(Answer, [Ans1, Ans2, Ans3, Ans4, Ans5, Ans6]), !.
check6(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6):- goodEvilNeutral(Char, Ans1), height(Char, Ans2), race(Char, Ans3), sex(Char, Ans4), ringOwner(Char, Ans5), usedBow(Char, Ans6), write('�� �������� '), write_str(Char), write('. �����?\n0.��\n1.���'), read(Answer), checkUsersAnswer(Answer, [Ans1, Ans2, Ans3, Ans4, Ans5, Ans6]), !.
check6(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6):- goodEvilNeutral(Char, Ans1), height(Char, Ans2), race(Char, Ans3), sex(Char, Ans4), ringOwner(Char, Ans5), isildurRelative(Char, Ans6), write('�� �������� '), write_str(Char), write('. �����?\n0.��\n1.���'), read(Answer), checkUsersAnswer(Answer, [Ans1, Ans2, Ans3, Ans4, Ans5, Ans6]), !.
check6(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6):-startAkinator(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6).

check7(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6, Ans7):- goodEvilNeutral(Char, Ans1), height(Char, Ans2), race(Char, Ans3), sex(Char, Ans4), ringOwner(Char, Ans5), foughtSpider(Char, Ans6), servedDenator(Char, Ans7),  write('�� �������� '), write_str(Char), write('. �����?\n0.��\n1.���'), read(Answer), checkUsersAnswer(Answer, [Ans1, Ans2, Ans3, Ans4, Ans5, Ans6, Ans7]), !.
check7(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6, Ans7):- goodEvilNeutral(Char, Ans1), height(Char, Ans2), race(Char, Ans3), sex(Char, Ans4), ringOwner(Char, Ans5), isildurRelative(Char, Ans6), diedFromSauron(Char, Ans7),  write('�� �������� '), write_str(Char), write('. �����?\n0.��\n1.���'), read(Answer), checkUsersAnswer(Answer, [Ans1, Ans2, Ans3, Ans4, Ans5, Ans6, Ans7]), !.
check7(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6, Ans7):-startAkinator(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6, Ans7).

check8(Ans1, Ans2, Ans3, Ans4, Ans5, Ans6, Ans7, Ans8):-  goodEvilNeutral(Char, Ans1), height(Char, Ans2), race(Char, Ans3), sex(Char, Ans4), ringOwner(Char, Ans5), isildurRelative(Char, Ans6), diedInFilm(Char, Ans7), denatorsSon(Char, Ans8), write('�� �������� '), write_str(Char), write('. �����?\n0.��\n1.���'), read(Answer), checkUsersAnswer(Answer, [Ans1, Ans2, Ans3, Ans4, Ans5, Ans6, Ans7, Ans8]).

/*��������, ��������� �� ������� ��������*/
checkUsersAnswer(0, _):- deleteFacts, !.
checkUsersAnswer(1, List):- write('������ �������� ���������?\n0.��\n1.���'), read(Answer), Answer = 0, write('������� ��� ���������: '), read_str(CharName), addCharacter(CharName, List).

deleteFacts:- deleteGEN, deleteHeight, deleteRace, deleteSex, deleteRingOwner, deleteIsildurRelative, deleteDiedFromSauron, deleteAragornLover, deleteOld, deleteDiedInFilm, deleteRohanKing, deleteFoughtSpider, deleteUsedBow, deleteServedDenator, deleteDenatorsSon.

/*-------------------------------�������� ������------------------------------------*/
deleteGEN:- goodEvilNeutral(X,Y), deleteGEN(X,Y).
deleteGEN(X,Y):- repeat, (goodEvilNeutral(X,Y) -> retract(goodEvilNeutral(X,Y));X=nil,Y=nil).

deleteHeight:- height(X,Y), deleteHeight(X,Y).
deleteHeight(X,Y):- repeat, (height(X,Y) -> retract(height(X,Y));X=nil,Y=nil).

deleteRace:- race(X,Y), deleteRace(X,Y).
deleteRace(X,Y):- repeat, (race(X,Y) -> retract(race(X,Y));X=nil,Y=nil).

deleteSex:- sex(X,Y), deleteSex(X,Y).
deleteSex(X,Y):- repeat, (sex(X,Y) -> retract(sex(X,Y));X=nil,Y=nil).



addCharacter(CharName, List):- nl, append('characters.txt'), write(CharName), nl, write_list(List).

write_list([]):-!.
write_list([H|T]):- write(H), write(" "), write_list(T).

write_str([]):-!.
write_str([H|T]):- put(H), write_str(T).

read_str(A):-get0(X),r_str(X,A,[]).
r_str(10,A,A):-!.
r_str(X,A,B):-append(B,[X],B1),get0(X1),r_str(X1,A,B1).






