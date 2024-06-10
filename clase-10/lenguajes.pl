% Sabemos que:
% Nahuel programa en JavaScript
% Juan programa en Haskell y Ruby
% Caro programa en Haskell y Scala
% Tito no programa en ningún lenguaje

persona(nahuel).
persona(juan).
persona(caro).
persona(tito).

programaEn(nahuel, javascript).
programaEn(juan, haskell).
programaEn(juan, ruby).
programaEn(caro, haskell).
programaEn(caro, scala).

% Sabemos que dos personas son colegas si programan en un mismo lenguaje.
% Queremos saber:
% 1. si Juan y Caro son colegas,
% 2. quiénes son colegas

sonColegas(UnaPersona, OtraPersona):-
    programaEn(UnaPersona, Lenguaje),
    programaEn(OtraPersona, Lenguaje),
    UnaPersona \= OtraPersona.

% Queremos implementar si una persona puede aprender un lenguaje de otra. Esto se cumple cuando la primera no programa en ese lenguaje y la segunda sí.

% Por ejemplo, nahue puede aprender scala de caro porque nahue no programa en scala y caro sí.

puedeAprenderDe(Aprendiz, Lenguaje, Maestro):-
    programaEn(Maestro, Lenguaje),
    persona(Aprendiz),
    not(programaEn(Aprendiz, Lenguaje)).

:-begin_tests(intro_logico).

test("Una persona puede aprender un lenguaje de otra si desconoce un lenguaje en el que la otra programa", nondet):-
    puedeAprenderDe(nahuel, scala, caro).

    test("Una persona no puede aprender un lenguaje si ya lo conoce"):-
        not(puedeAprenderDe(caro, haskell, juan)).

    test("Una persona no puede aprender un lenguaje de otra si la otra persona no conoce el lenguaje"):-
     not(puedeAprenderDe(nahuel, scala, juan)).

    test("Una persona no puede aprender un lenguaje de si misma"):-
    not(puedeAprenderDe(juan, haskell, juan)).

:-end_tests(intro_logico).
% 

% 

% 

