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
