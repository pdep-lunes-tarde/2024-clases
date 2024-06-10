% Sabemos que:
% Nahuel programa en JavaScript
% Juan programa en Haskell y Ruby
% Caro programa en Haskell y Scala
% Tito no programa en ningún lenguaje

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

:-begin_tests(intro_logico).

% test(una_persona_puede_aprender_un_lenguaje_de_otra_si_desconoce_un_lenguaje_en_el_que_la_otra_programa, nondet):-
%     puedeAprenderDe(nahuel, scala, caro).

% test(una_persona_no_puede_aprender_un_lenguaje_de_otra_si_ya_conoce_el_lenguaje):-
%     not(puedeAprenderDe(caro, haskell, juan)).

% test(una_persona_no_puede_aprender_un_lenguaje_de_otra_si_la_otra_persona_no_conoce_el_lenguaje):-
%     not(puedeAprenderDe(nahuel, scala, juan)).
:-end_tests(intro_logico).
