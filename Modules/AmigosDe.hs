module Modules.AmigosDe where
import Modules.FuncionesBase
import Modules.FuncionesAuxiliares
import Test.HUnit
amigosDe :: RedSocial -> Usuario -> [Usuario]
amigosDe (usrs, rels, pubs) us = amigosDeAux rels us 

amigosDeAux :: [Relacion] -> Usuario -> [Usuario]
amigosDeAux [] _ = []
amigosDeAux (rel:rels) us
    | us2 == us = us1:amigosDeAux rels us
    | us1 == us = us2:amigosDeAux rels us
    | otherwise = amigosDeAux rels us
    where 
        us1 = primeroDeDupla rel
        us2 = segundoDeDupla rel
