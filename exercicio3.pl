fatorial(0, 1). % Caso base
fatorial(N, F) :-
    N > 0,
    Nmenos1 is N - 1,
    fatorial(Nmenos1, Nmenos1F),
    F is Nmenos1F * N.
