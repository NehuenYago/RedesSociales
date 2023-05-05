module Modules.AmigosDe where
import Modules.FuncionesBase

amigosDe :: RedSocial -> Usuario -> [Usuario]
amigosDe (usrs, rels, pubs) us = amigosDeAux rels us 

amigosDeAux :: [Relacion] -> Usuario -> [Usuario]
amigosDeAux (rel:rels) us
    | null rels && us2 == us = [us1]
    | null rels && us1 == us = [us2]
    | null rels = []
    | us2 == us = us1:amigosDeAux rels us
    | us1 == us = us2:amigosDeAux rels us
    | otherwise = amigosDeAux rels us
    where 
        us1 = fst rel
        us2 = snd rel
