% Fatos
progenitor(jose,joao).
progenitor(jose,ana).
progenitor(maria,joao).
progenitor(maria,ana).
progenitor(ana,helena).
progenitor(ana,joana).
progenitor(joao,mario).
progenitor(helena,carlos).
progenitor(mario,carlos).

masculino(jose).
masculino(joao).
masculino(mario).
masculino(carlos).
feminino(ana).
feminino(maria).
feminino(helena).
feminino(joana).

% Regras
descendente(X,Y) :-
    progenitor(Y,X).

mae(X,Y) :-
    progenitor(X,Y),feminino(X).

pai(X,Y) :-
    progenitor(X,Y),masculino(X).

avo(X,Z) :-
    progenitor(Y,Z),progenitor(X,Y),masculino(X).

irmao(Z,Y) :-
    progenitor(X,Y),progenitor(X,Z),masculino(Z).

irma(Z,Y) :-
    progenitor(X,Y),progenitor(X,Z),feminino(Z).

tio(Y,Z) :-
    progenitor(X,Z),progenitor(W,X),progenitor(W,Y),masculino(Y).

primo(Y,Z) :-
    progenitor(X,Z),progenitor(W,X),progenitor(W,K),progenitor(K,Y),masculino(Y).

primos(Y,Z) :-
    progenitor(X,Z),progenitor(W,X),progenitor(W,K),progenitor(K,Y).

q1 :-
    progenitor(jose,joao).

q2(X) :-
    descendente(X,maria).

q3(X) :-
    primos(X,mario).

q4(L):- findall(X,tio(_,X),LR),list_to_set(LR,L).

q5(X) :-
    progenitor(X,carlos).

q6 :-
   irmao(_,helena),write('Tem irmaos');
   irma(_,helena),write('Tem irmas').
