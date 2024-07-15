
% Migue es maestro cocinero y su herramienta es una olla essen.
% Carla es maestra alquimista y su herramienta es un mechero.
% Feche es aprendiz de mecánico y su herramienta es una llave inglesa.
% Aye es oficial alquimista y su herramienta es una piedra filosofal.

%trabajador(Nombre, Profesion, Herramienta).
trabajador(migue, profesion(cocina, maestro), ollaEssen).
trabajador(carla, profesion(alquimia, maestro), mechero).
trabajador(feche, profesion(mecanica, aprendiz), llaveInglesa).
trabajador(aye, profesion(alquimia, oficial), piedraFilosofal).

camaradas(UnaPersona, OtraPersona):-
    trabajador(UnaPersona, Profesion, _),
    trabajador(OtraPersona, OtraProfesion, _),
    sonDelMismoArea(Profesion, OtraProfesion),
    UnaPersona \= OtraPersona.

sonDelMismoArea(profesion(Area, _), profesion(Area, _)).

puedeEntrenar(Tutor, Alumno):-
    camaradas(Tutor, Alumno),
    tieneMasExperiencia(Tutor, Alumno).

tieneMasExperiencia(AlguienConMasExperiencia, AlguienConMenos):-
    trabajador(AlguienConMasExperiencia, profesion(_, ExperienciaMayor), _),
    trabajador(AlguienConMenos, profesion(_, ExperienciaMenor), _),
    esMayorRango(ExperienciaMayor, ExperienciaMenor).

inmediatamenteMayor(oficial, aprendiz).
inmediatamenteMayor(experto, oficial).
inmediatamenteMayor(maestro, experto).

esMayorRango(RangoMayor, RangoMenor):-
    inmediatamenteMayor(RangoMayor, RangoMenor).
esMayorRango(RangoMayor, RangoMenor):-
    inmediatamenteMayor(RangoMayor, RangoIntermedio),
    esMayorRango(RangoIntermedio, RangoMenor).


% esMayorRango(maestro, oficial).
% esMayorRango(maestro, aprendiz).
% esMayorRango(oficial, aprendiz).
% esMayorRango(maestro, experto).
% esMayorRango(experto, oficial).
% esMayorRango(experto, aprendiz).

% Tareas, ¿Quién puede hacer cada una?

puedeHacer(Trabajador, cocinarMilanesas):-
    trabajador(Trabajador, profesion(cocina, _), _).

puedeHacer(Trabajador, recalentarComida):-
    trabajador(Trabajador, profesion(cocina, _), _).
puedeHacer(Trabajador, recalentarComida):-
    trabajador(Trabajador, _, mechero).

puedeHacer(Trabajador, producirMedicina(Gramos)):-
    trabajador(Trabajador, profesion(alquimia, Rango), _),
    not(esMayorRango(Rango, oficial)),
    between(1, 100, Gramos).
puedeHacer(Trabajador, producirMedicina(_)):-
    trabajador(Trabajador, profesion(alquimia, Rango), _),
    esMayorRango(Rango, oficial).

puedeHacer(Trabajador, repararAparato(Herramienta)):-
    trabajador(Trabajador, profesion(mecanica, _), Herramienta).

puedeHacer(migue, repararAparato(Herramienta)):-
    trabajador(_, _, Herramienta).

puedeHacer(Trabajador, crearObraMaestra(Area)):-
    trabajador(Trabajador, profesion(Area, maestro), _).
puedeHacer(Trabajador, crearObraMaestra(alquimia)):-
    trabajador(Trabajador, _, piedraFilosofal).

% reparar un aparato: para cada aparato sabemos con qué herramienta se puede arreglar. Y solo puede ser arreglado por alguien que trabaje en mecánica y tenga esa herramienta.

% cocinar milanesas con puré: puede hacerlo cualquier cocinero.

% recalentar comida: puede hacerlo cualquier cocinero o cualquiera que tenga un mechero.

% producir cierta cantidad de medicina: alquimistas de oficiales para abajo pueden hacer solo hasta 100 gramos, alquimistas de grado más alto pueden hacer cualquier cantidad.

% reparar un aparato: para cada aparato sabemos con qué herramienta se puede arreglar. Y solo puede ser arreglado por alguien que trabaje en mecánica y tenga esa herramienta.
% Además, Migue se da maña arreglando cualquier cosa así que siempre puede reparar lo que sea.


% Tareas, ¿Quién puede hacer cada una?

% crear obra maestra de un área: donde el área podría ser alquimia, cocina, mecánica, etc.
% Sólo puede ser hecha por una persona que tenga maestría en ese área.
% Además, en el caso de la alquimia cualquiera con una piedra filosofal puede crear una obra maestra.

% -------------

% ¿puede cubrir?

% Una persona puede cubrir a otra en cierta tarea si ambas pueden hacerla.

puedeCubrir(QuienCubre, Cubierto, Tarea):-
    puedeHacer(QuienCubre, Tarea),
    puedeHacer(Cubierto, Tarea),
    QuienCubre \= Cubierto.

% ¿es irremplazable?

% Una persona es irremplazable para una tarea si puede hacerla y nadie puede cubrirla para la misma.

irremplazable(Persona, Tarea):-
    puedeHacer(Persona, Tarea),
    % forall(
    %     trabajador(Trabajador, _, _),
    %     not(puedeCubrir(Trabajador, Persona, Tarea))
    % ). <- esta consulta es lo mismo que:
    not(puedeCubrir(_, Persona, Tarea)).

% comodín

% Decimos que una persona es un comodín si puede realizar todas las tareas conocidas.

comodin(Persona):-
    trabajador(Persona, _, _),
    forall(
        puedeHacer(_, Tarea),
        puedeHacer(Persona, Tarea)
    ).