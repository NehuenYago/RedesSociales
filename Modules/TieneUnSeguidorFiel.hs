module Modules.TieneUnSeguidorFiel where
import Modules.FuncionesBase
import Modules.PublicacionesDe
import Modules.FuncionesAuxiliares

-- quiero ver si un usuario tiene un seguidor fiel, esto es, otro usuario de la misma red que le dio like a todas las publiaciones del primero
-- para eso necesito la lista de publicaicones del usuario y la lista de likes de cada publiacion
-- si en cada lista de likes de cada publicacion encuentro a un mismo usuario entonces este ultimo es un seguidor fiel del primero

tieneUnSeguidorFiel :: RedSocial -> Usuario -> Bool
tieneUnSeguidorFiel red us = tieneElementosEnComun (listaDeLikes (publicacionesDe red us))

-- me devuelve una lista de listas de likes de las publiaciones del usuario
listaDeLikes :: [Publicacion] -> [[Usuario]]
listaDeLikes [(_, _, lk)] = [lk]
listaDeLikes ((_, _, lk) : xs) = lk : listaDeLikes xs

-- toma una lista de listas y devuelve una lista con los elementos comunes a todas
verificaElementosEnComun :: (Eq a) => [[a]] -> [a]
verificaElementosEnComun [] = []
verificaElementosEnComun [l] = l
verificaElementosEnComun (l:ls) = interseccion l (verificaElementosEnComun ls)
    where
        -- devuelve la interseccion (los elementos comunes) entre dos listas
        interseccion [] _ = []
        interseccion (x:xs) ys 
            | pertenece x ys = x : interseccion xs ys
            | otherwise = interseccion xs ys

-- determina si una lista de listas tiene elementos en comun en todas las sublistas
tieneElementosEnComun :: (Eq a) => [[a]] -> Bool
tieneElementosEnComun listaDeListas = not (longitud (verificaElementosEnComun listaDeListas) == 0)

remueveAutoLikes :: [Publicacion] -> [Publicacion]
remueveAutoLikes = undefined