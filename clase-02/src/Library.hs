module Library (module Library, isPrefixOf, isSuffixOf) where

import PdePreludat
import Data.List (isPrefixOf, isSuffixOf)

-- preguntar :: String -> String
-- preguntar oracion
--     | isPrefixOf "¿" oracion && isSuffixOf "?" oracion = oracion
--     | not (isSuffixOf "?" oracion) && isPrefixOf "¿" oracion =oracion ++ "?"
--     | not (isPrefixOf "¿" oracion) && isSuffixOf "?" oracion = "¿" ++ oracion 
--     | otherwise = "¿" ++ oracion ++ "?"

preguntar :: String -> String
preguntar oracion =
    garantizarSignoDePreguntaQueAbre (garantizarSignoDePreguntaQueCierra oracion)

garantizarSignoDePreguntaQueCierra :: String -> String
garantizarSignoDePreguntaQueCierra oracion
    | isSuffixOf "?" oracion = oracion
    | otherwise = oracion ++ "?"

garantizarSignoDePreguntaQueAbre :: String -> String
garantizarSignoDePreguntaQueAbre oracion
    | isPrefixOf "¿" oracion = oracion
    | otherwise = "¿" ++ oracion

-- isPrefixOf nos dice si un string empieza con otro string
-- isSuffixOf nos dice si un string termina con otro string
-- ++

-- >>> isSuffixOf "ojos" "anteojos"
-- True
--
-- >>> isPrefixOf "ante" "anteojos"
-- True
--
-- >>> "hola " ++ "mundo"
-- "hola mundo"

-- Queremos que funcione así:
-- >>> preguntar "hola"
-- ""
-- >>> preguntar "hola?"
-- ""
