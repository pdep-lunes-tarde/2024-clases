
% Migue es maestro cocinero y su herramienta es una olla essen.
% Carla es maestra alquimista y su herramienta es un mechero.
% Feche es aprendiz de mecánico y su herramienta es una llave inglesa.
% Aye es oficial alquimista y su herramienta es una piedra filosofal.

% Queremos saber quienes son camaradas:
% son aquellas personas que
% trabajan en el mismo área



% Queremos saber quienes pueden entrenar a quienes:
% deben ser camaradas y quién entrena tiene
% que tener más experiencia

% aprendiz < oficial < experto < maestro

% esMayorExperiencia(MayorRango, MenorRango).


% Tareas, ¿Quién puede hacer cada una?

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


% ¿es irremplazable?

% Una persona es irremplazable para una tarea si puede hacerla y nadie puede cubrirla para la misma.


% comodín

% Decimos que una persona es un comodín si puede realizar todas las tareas conocidas.

