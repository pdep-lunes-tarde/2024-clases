% Registramos las características de las lechuzas de la zona (nombre, sospechosidad y nobleza) con un predicado lechuza/3.

% lechuza(Lechuza, Sospechosidad, Nobleza)
lechuza(duo, 10, 2).

lechuza(prolog, 10, 51).

lechuza(noctowl, 20, 42).
lechuza(coo, 80, 55).

% Necesitamos saber:
% ¿Qué tan violenta es una lechuza?
% Se calcula como 5 * sospechosidad + 42 / nobleza.

violencia(Lechuza, NivelDeViolencia):-
    lechuza(Lechuza, Sospechosidad, Nobleza),
    NivelDeViolencia is 5 * Sospechosidad + 42 / Nobleza.

% Si una lechuza es vengativa. Lo es si su violencia es mayor a 100.

vengativa(Lechuza):-
    violencia(Lechuza, NivelDeViolencia),
    NivelDeViolencia > 100.

% Si una lechuza es mafiosa, que se cumple si no es buena gente o su sospechosidad es al menos 75.
% Decimos que es buena gente si no es vengativa y su nobleza es mayor a 50.

noEsBuenaGente(Lechuza):-
    not(buenaGente(Lechuza)).

mafiosa(Lechuza):-
    lechuza(Lechuza, _, _),
    noEsBuenaGente(Lechuza).
mafiosa(Lechuza):-
    lechuza(Lechuza, Sospechosidad, Nobleza),
    Sospechosidad >= 75.


buenaGente(Lechuza):-
    lechuza(Lechuza, Sospechosidad, Nobleza),
    not(vengativa(Lechuza)),
    Nobleza > 50.

:- begin_tests(lechuzas).
    test("La violencia de una lechuza es 5 * su sospechosidad + 42 / su nobleza"):-
        violencia(duo, 71).

    test("Una lechuza es vengativa si su nivel de violencia es mayor a 100"):-
        vengativa(noctowl).

    test("Una lechuza NO es vengativa si su nivel de violencia es menor o igual a 100"):-
        not(vengativa(duo)).
        

:- end_tests(lechuzas).
