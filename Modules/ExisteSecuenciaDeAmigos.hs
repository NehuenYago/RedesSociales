module Modules.ExisteSecuenciaDeAmigos where
import Modules.FuncionesBase
import Modules.FuncionesAuxiliares
import Modules.AmigosDe

existeSecuenciaDeAmigos :: RedSocial -> Usuario -> Usuario -> Bool
existeSecuenciaDeAmigos red us1 us2
    | pertenece us2 (circuloDeAmigos red us1) = True 
    | otherwise = False

circuloDeAmigos :: RedSocial -> Usuario -> [Usuario]
circuloDeAmigos red us = expandirCirculoDeAmigos red [us] []

expandirCirculoDeAmigos :: RedSocial -> [Usuario] -> [Usuario] -> [Usuario]
expandirCirculoDeAmigos red [] expandidos = []
expandirCirculoDeAmigos red aExpandir expandidos 
    | pertenece us expandidos = expandirCirculoDeAmigos red aExpandirSinUs expandidos 
    | otherwise = unirSinRepetir (amigosDe red us) (expandirCirculoDeAmigos red aExpandirSinUsConAmigos expandidosConUs)
    where 
        us = head aExpandir
        aExpandirSinUs = tail aExpandir
        aExpandirSinUsConAmigos = unirSinRepetir aExpandirSinUs (amigosDe red us)
        expandidosConUs = agregarSinRepetir us expandidos

agregarSinRepetir :: (Eq t) => t -> [t] -> [t]
agregarSinRepetir x xs
    | pertenece x xs = xs
    | otherwise = x:xs

unirSinRepetir :: (Eq t) => [t] -> [t] -> [t]
unirSinRepetir [] ys = ys
unirSinRepetir (x:xs) ys 
    | not (pertenece x ys) = x:unirSinRepetir xs ys
    | otherwise = unirSinRepetir xs ys
