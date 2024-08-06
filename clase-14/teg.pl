jugador(amarillo).
jugador(magenta).
jugador(azul).
jugador(verde).
jugador(negro).
jugador(rojo).

continente(americaDelSur).
continente(americaDelNorte).
continente(asia).
continente(oceania).
continente(europa).
continente(africa).

estaEn(americaDelSur, argentina).
estaEn(americaDelSur, brasil).
estaEn(americaDelSur, chile).
estaEn(americaDelSur, uruguay).
estaEn(americaDelSur, peru).
estaEn(americaDelSur, colombia).

estaEn(americaDelNorte, alaska).
estaEn(americaDelNorte, yukon).
estaEn(americaDelNorte, canada).
estaEn(americaDelNorte, oregon).
estaEn(americaDelNorte, nuevaYork).
estaEn(americaDelNorte, terranova).
estaEn(americaDelNorte, labrador).
estaEn(americaDelNorte, mexico).
estaEn(americaDelNorte, groenlandia).
estaEn(americaDelNorte, california).

estaEn(europa, islandia).
estaEn(europa, granBretania).
estaEn(europa, suecia).
estaEn(europa, rusia).
estaEn(europa, polonia).
estaEn(europa, alemania).
estaEn(europa, italia).
estaEn(europa, francia).
estaEn(europa, espania).

estaEn(asia, aral).
estaEn(asia, tartaria).
estaEn(asia, taimir).
estaEn(asia, kamchatka).
estaEn(asia, china).
estaEn(asia, siberia).
estaEn(asia, japon).
estaEn(asia, mongolia).
estaEn(asia, iran).
estaEn(asia, gobi).
estaEn(asia, india).
estaEn(asia, malasia).
estaEn(asia, turquia).
estaEn(asia, israel).
estaEn(asia, arabia).

estaEn(oceania, australia).
estaEn(oceania, sumatra).
estaEn(oceania, java).
estaEn(oceania, borneo).

estaEn(africa, sahara).
estaEn(africa, egipto).
estaEn(africa, etiopia).
estaEn(africa, madagascar).
estaEn(africa, sudafrica).
estaEn(africa, zaire).

ocupa(aral, magenta).

ocupa(alaska, amarillo).
ocupa(yukon, amarillo).
ocupa(oregon, amarillo).
ocupa(canada, amarillo).
ocupa(groenlandia, amarillo).
ocupa(labrador, amarillo).
ocupa(terranova, amarillo).
ocupa(nuevaYork, amarillo).
ocupa(california, amarillo).
ocupa(mexico, amarillo).

ocupa(islandia, amarillo).
ocupa(suecia, amarillo).
ocupa(rusia, amarillo).
ocupa(polonia, amarillo).

ocupa(turquia, amarillo).

ocupa(sahara, amarillo).
ocupa(egipto, amarillo).
ocupa(etiopia, amarillo).
ocupa(zaire, amarillo).
ocupa(madagascar, amarillo).
ocupa(sudafrica, amarillo).

ocupa(argentina, azul).
ocupa(chile, azul).
ocupa(uruguay, azul).

ocupa(china, azul).
ocupa(japon, azul).
ocupa(iran, azul).
ocupa(india, azul).
ocupa(malasia, azul).
ocupa(gobi, azul).

ocupa(australia, azul).
ocupa(borneo, azul).
ocupa(java, azul).
ocupa(sumatra, azul).

ocupa(israel, negro).
ocupa(arabia, negro).

ocupa(mongolia, verde).
ocupa(taimir, verde).
ocupa(tartaria, verde).
ocupa(siberia, verde).
ocupa(kamchatka, verde).

ocupa(italia, verde).

ocupa(brasil, verde).
ocupa(colombia, verde).
ocupa(peru, verde).

ocupa(francia, rojo).
ocupa(granBretania, rojo).
ocupa(espania, rojo).
ocupa(alemania, rojo).

cuantosEjercitosIncorpora(Jugador, Cantidad):-
    cuantosEjercitosIncorporaPorCantidadDePaises(Jugador, CantidadPorPaises),
    cuantosEjercitosIncorporaPorContinentes(Jugador, CantidadPorContinentes),
    Cantidad is CantidadPorPaises + CantidadPorContinentes.

cuantosEjercitosIncorporaPorCantidadDePaises(Jugador, Cantidad):-
    jugador(Jugador),
    findall(Pais, ocupa(Pais, Jugador), Paises),
    length(Paises, CantidadDePaises),
    MitadDeCantidadDePaises is CantidadDePaises // 2,
    mayorEntre(MitadDeCantidadDePaises, 3, Cantidad).

mayorEntre(UnNumero, OtroNumero, UnNumero):-
    UnNumero >= OtroNumero.
mayorEntre(UnNumero, OtroNumero, OtroNumero):-
    UnNumero < OtroNumero.

cuantosEjercitosIncorporaPorContinentes(Jugador, CantidadTotal):-
    jugador(Jugador),
    findall(
        Cantidad,
        cantidadDeEjercitosQueIncorporaPorContinente(Jugador, _, Cantidad),
        Cantidades),
    sum_list(Cantidades, CantidadTotal).

cantidadDeEjercitosQueIncorporaPorContinente(Jugador, Continente, Cantidad):-
    ocupaContinente(Jugador, Continente),
    ejercitosPorContinente(Continente, Cantidad).

ejercitosPorContinente(asia, 7).
ejercitosPorContinente(americaDelNorte, 5).
ejercitosPorContinente(europa, 5).
ejercitosPorContinente(americaDelSur, 3).
ejercitosPorContinente(africa, 3).
ejercitosPorContinente(oceania, 2).

ocupaContinente(Jugador, Continente):-
    jugador(Jugador),
    continente(Continente),
    forall(estaEn(Continente, Pais), ocupa(Pais, Jugador)).

% Al principio de cada turno se incorporan ejércitos al mapa. Queremos saber cuántos ejércitos puede incorporar un jugador. Es la suma de:
% la mitad de los países que ocupa (se redondea para abajo), ó 3 si no llega a los 6 países 
% lo que corresponda por cada continente ocupado por completo:
% Asia . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 7 ejércitos 
% Europa . . . . . . . .. . . . . . . . . . . . . . . . . . . 5 ejércitos 
% America del Norte . . . . . . . . . . . . . . . . . . 5 ejércitos 
% America del Sur . . . . . . . . . . . . . . . . . . . .3 ejércitos 
% Africa . . . . . . . . . . . . . . . . . . . . . . . . . . . . 3 ejércitos 
% Oceania . . . . . . . . . . . . . . . . . . . . . . . . . . 2 ejércitos
