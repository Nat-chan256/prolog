startAkinator:- readCharacters, question1(Ans1), question2(Ans2), check2(Ans1, Ans2).

question1(Answer):- write("�� ����� ������� �������� ��� ��������?"), nl,
    write("0. �� ������� �����."), nl,
    write("1. �� ������� ���."), nl,
    write("2. �������� ������ ���������."), nl,
    read(Answer).

question2(Answer):- write("����� ���� ������ ���������?"), nl,
    write("0. ���� �������������."), nl,
    write("1. ������������."), nl,
    write("2. ���� �������������."), nl,
    read(Answer).

/*�������� ����� ������ ���� ��������*/
/*��������� � ����� ����������� ����. �������:*/
/*��� ���������*/
/*�����-������*/
check2(Ans1, Ans2):- goodEvilNeutral(Char, Ans1), height(Char, Ans2), write(Char).

read_str(A):-get0(X),r_str(X,A,[]).
r_str(10,A,A):-!.
r_str(X,A,B):-append(B,[X],B1),get0(X1),r_str(X1,A,B1).
