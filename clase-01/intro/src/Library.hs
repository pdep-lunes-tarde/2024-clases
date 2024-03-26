module Library where
import PdePreludat

-- Ejercicio: año bisiesto

-- Un año es bisiesto si es divisible por 400 o
-- si es divisible por 4 pero no por 100.

-- REPL

-- READ
-- EVALUATE
-- PRINT
-- LOOP

esBisiesto :: Number -> Bool
esBisiesto anio =
    divide anio 400 || divide anio 4 && not (divide anio 100)

divide :: Number -> Number -> Bool
divide dividendo divisor = mod dividendo divisor == 0

anioActualEsBisiesto :: Bool
anioActualEsBisiesto = esBisiesto anioActual

anioActual :: Number
anioActual = 2024








-- Declaratividad y expresividad

-- int cuantosPares(int numeros[], int tamanio) {
--   int i, contadorDePares = 0;

--   for (i=0; i < tamanio; i++) {
--     if(esPar(numeros[i])){
--       contadorDePares = contadorDePares + 1;
--     }
--   }

--   return contadorDePares;
-- }

cuantosPares = length . filter even
