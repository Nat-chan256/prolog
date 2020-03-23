sum(X):- sum(10, 0, X).

sum(1000000,Cur_sum,Cur_sum):-!.
sum(N,Cur_sum,X):-main_check(N), N1 is N+1, Cur_sum1 is Cur_sum + N, sum(N1,Cur_sum1,X),!.
sum(N,Cur_sum,X):-N1 is N+1, sum(N1,Cur_sum,X).

main_check(N):-isAbsolutelyPrimeL(N), isAbsolutelyPrimeR(N).
isAbsolutelyPrimeL(N):- N < 10, prime(N), !.
isAbsolutelyPrimeL(N):- prime(N), deleteLeftDigit(N, NewN), isAbsolutelyPrimeL(NewN).

isAbsolutelyPrimeR(N):- N < 10, prime(N), !.
isAbsolutelyPrimeR(N):- prime(N), deleteRightDigit(N, NewN), isAbsolutelyPrimeR(NewN).

deleteLeftDigit(N, Result):- deleteLeftDigit(N, Result, 100000).
deleteLeftDigit(N, Result, Digit):- Remainder is N mod Digit, Remainder \= N, Result is Remainder, !.
deleteLeftDigit(N, Result, Digit):- NextDigit is Digit / 10, deleteLeftDigit(N, Result, NextDigit).

deleteRightDigit(N, Result):- Result is N div 10.

prime(X):- prime(X, 2).
prime(0,_):-!,fail.
prime(1,_):-!,fail.
prime(X, N):-N2 is N*N, N2 > X,!.
prime(X, N):-Remainder is X mod N, Remainder \= 0, N1 is N + 1, prime(X, N1).
