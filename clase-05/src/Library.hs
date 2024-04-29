{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use map" #-}
{-# HLINT ignore "Use foldl" #-}
{-# HLINT ignore "Eta reduce" #-}
{-# HLINT ignore "Use sum" #-}
{-# HLINT ignore "Use concat" #-}
module Library where
import PdePreludat

data Entrenador = Entrenador { 
    cantidadPokebolas :: Number, 
    pokemons :: [Pokemon] 
    } deriving(Eq, Show)

data Tipo = Electrico | Fuego | Agua deriving(Eq, Show)

data Pokemon = Pokemon {
    tipo :: Tipo, 
    experiencia :: Number 
    } deriving(Eq, Show)

entrenador :: Entrenador
entrenador = Entrenador 10 [pikachu, charmander, squirtle]

pikachu :: Pokemon
pikachu = Pokemon Electrico 0

otroPikachu :: Pokemon
otroPikachu = Pokemon Electrico 2500

charmander :: Pokemon
charmander = Pokemon Fuego 200

charizard :: Pokemon
charizard = Pokemon Fuego 5000

squirtle :: Pokemon
squirtle = Pokemon Agua 1000

esDeTipoElectrico :: Pokemon -> Bool
esDeTipoElectrico pokemon = esDeTipo Electrico pokemon 

esDeTipoAgua :: Pokemon -> Bool
esDeTipoAgua pokemon = esDeTipo Agua pokemon 

esDeTipoFuego :: Pokemon -> Bool
esDeTipoFuego pokemon = esDeTipo Fuego pokemon 

esFuerte :: Pokemon -> Bool
esFuerte pokemon = experiencia pokemon >= 1000

esRaro :: Pokemon -> Bool
esRaro pokemon = esDeTipoFuego pokemon && esFuerte pokemon

-- 2) a)

-- filter
-- seleccionar :: (a -> Bool) -> [a] -> [a]
-- seleccionar condicion [] = []
-- seleccionar condicion (x : xs)
--     | condicion x = x : seleccionar  condicion xs
--     | otherwise = seleccionar condicion xs 

losFuertes :: [Pokemon] -> [Pokemon]
losFuertes pokemons = filter esFuerte pokemons

losRaros :: [Pokemon] -> [Pokemon]
losRaros pokemones = filter esRaro pokemones

losDeTipo :: Tipo -> [Pokemon] -> [Pokemon]
losDeTipo unTipo pokemones =
    filter (esDeTipo unTipo) pokemones
--                                  ^ Pokemon -> Bool
-- esDeTipo
esDeTipo :: Tipo -> Pokemon -> Bool
esDeTipo unTipo pokemon = tipo pokemon == unTipo

entrenar :: Number -> Pokemon -> Pokemon
entrenar minutos pokemon =
    aumentarExperiencia (minutos * 2) pokemon

aumentarExperiencia :: Number -> Pokemon -> Pokemon
aumentarExperiencia cantidad (Pokemon unTipo experiencia) =
    Pokemon unTipo (experiencia + cantidad)

entrenarEquipo :: Number -> Entrenador -> Entrenador
entrenarEquipo minutos (Entrenador cantidadPokebolas pokemons) =
    Entrenador cantidadPokebolas
               (entrenarVarios minutos pokemons)

-- map
transformarVarios :: (a -> b) -> [a] -> [b]
transformarVarios f [] = []
transformarVarios f (x:xs) = f x : transformarVarios f xs

entrenarVarios :: Number -> [Pokemon] -> [Pokemon]
entrenarVarios minutos pokemons =
    map (entrenar minutos) pokemons

entrenarVarios minutos [] = []
entrenarVarios minutos (pokemon : pokemons) =
    entrenar minutos pokemon : entrenarVarios minutos pokemons

puedeSerLiderDeGimnasio :: Entrenador -> Bool
puedeSerLiderDeGimnasio entrenador =
    tieneAlgunPokemon entrenador &&
    any esFuerte (pokemons entrenador) &&
    all (esDelMismoTipoQue (primerPokemon entrenador))
        (pokemons entrenador)

esDelMismoTipoQue :: Pokemon -> Pokemon -> Bool
esDelMismoTipoQue unPokemon otroPokemon =
    tipo unPokemon == tipo otroPokemon

tieneAlgunPokemon :: Entrenador -> Bool
tieneAlgunPokemon entrenador =
    not (null (pokemons entrenador))

primerPokemon :: Entrenador -> Pokemon
primerPokemon entrenador = head (pokemons entrenador)

enfrentarPokemon :: Pokemon -> Entrenador -> Entrenador
enfrentarPokemon pokemon (Entrenador 0 pokemons) =
    Entrenador 0 pokemons
enfrentarPokemon pokemon (Entrenador cantidadPokebolas pokemons) =
    Entrenador (cantidadPokebolas - 1) (pokemon : pokemons)

enfrentarHorda :: [Pokemon] -> Entrenador -> Entrenador
enfrentarHorda [] entrenador = entrenador
enfrentarHorda (pokemon:pokemons) entrenador =
    enfrentarHorda pokemons (enfrentarPokemon pokemon entrenador)

enfrentarHorda' :: [Pokemon] -> Entrenador -> Entrenador
enfrentarHorda' pokemons entrenador = foldr enfrentarPokemon entrenador pokemons

sumatoria :: [Number] -> Number
sumatoria numeros = foldr (+) 0 numeros

concatenarTodos :: [String] -> String
concatenarTodos strings = foldr1 (++) strings

-- sumatoria [1,2,3]