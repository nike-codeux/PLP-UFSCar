desparentizar([], []).
desparentizar([X|Y], [X|L]):- compound(X), not(is_list(X)), 
                              desparentizar(Y, L), !.
desparentizar([X|Y], [X|L]):- atomic(X), desparentizar(Y, L), !.
desparentizar([X|Y], L):- is_list(X), desparentizar(X, L1),
                          desparentizar(Y, L2), append(L1, L2, L), !.
desparentizar([_|Y], L):- desparentizar(Y,L).

ocorrencias([], _, []).
ocorrencias([X|Y], L, [X|Z]):- member(X, L), ocorrencias(Y, L, Z), !.
ocorrencias([_|Y], L, Z):- ocorrencias(Y, L, Z).

apagar(_, [], []).
apagar(E, [E|Y], L):- apagar(E, Y, L), !.
apagar(E, [E1|Y], [E1|L]):- E \== E1, apagar(E, Y, L).

unicos([], []).
unicos([X|Y1], [X|L]):- apagar(X, Y1, L1), unicos(L1, L).

conta(_, [], 0).
conta(E, [X|Y], N):- E == X, conta(E, Y, N1), N is N1+1, !.
conta(E, [_|Y], N):- conta(E, Y, N).

pares([], _, []).
pares([X|Y1], Y, [[X,S]|L]):- conta(X, Y, S), pares(Y1, Y, L).

conta_atomos(L1, L2, OUT):- desparentizar(L1, LA), desparentizar(L2, LB),
                            ocorrencias(LA, LB, A), ocorrencias(LB, LA, B),
                            append(A, B, C), pares(C, C, L), unicos(L, OUT).


run:- write('Digite uma lista da forma: [L1].'),
      nl, read(L1),
      write('Digite uma lista da forma: [L2].'),
      nl, read(L2),
      conta_atomos(L1, L2, L),
      write('Resultado'), nl,
      write(L), nl.
               
               