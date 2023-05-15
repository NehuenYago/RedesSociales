module Modules.AmigosDe where
import Modules.FuncionesBase
import Modules.FuncionesAuxiliares

amigosDe :: RedSocial -> Usuario -> [Usuario]
amigosDe (usrs, rels, pubs) us = amigosDeAux rels us 

amigosDeAux :: [Relacion] -> Usuario -> [Usuario]
amigosDeAux (rel:rels) us
    | longitud rels == 0 = []
    | us2 == us = us1:amigosDeAux rels us
    | us1 == us = us2:amigosDeAux rels us
    | otherwise = amigosDeAux rels us
    where 
        us1 = primeroDeDupla rel
        us2 = segundoDeDupla rel
