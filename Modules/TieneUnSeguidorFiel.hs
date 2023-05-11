module Modules.TieneUnSeguidorFiel where
import Modules.FuncionesBase
import Modules.PublicacionesDe
import Modules.FuncionesAuxiliares

-- quiere ver si un usuario tiene un seguidor fiel, esto es, otro usuario de la misma red que le dio like a todas las publiaciones del primero
-- para eso necesito la lista de publicaicones del usuario y la lista de likes de cada publiacion
-- si en cada lista de likes de cada publicacion encuentro a un mismo usuario entonces este ultimo es un seguidor fiel del primero

tieneUnSeguidorFiel :: RedSocial -> Usuario -> Bool
tieneUnSeguidorFiel red us = tieneElementosEnComun (listaDeLikes (publicaciones red us))

listaDeLikes :: [Publicacion] -> [[Usuario]]
listaDeLikes [] = error "El usuario no tiene publiaciones"
listaDeLikes [(_, _, lk)] = [lk]
listaDeLikes ((_, _, lk) : xs) = lk : listaDeLikes xs

-- toma una lista de listas y devuelve una lista con los elementos comunes a todas
verificaElementosEnComun :: (Eq a) => [[a]] -> [a]
verificaElementosEnComun [] = []
verificaElementosEnComun [l] = l
verificaElementosEnComun (l:ls) = interseccion l (verificaElementosEnComun ls)
    where
        interseccion [] _ = []
        interseccion (x:xs) ys 
            | pertenece x ys = x : interseccion xs ys
            | otherwise = interseccion xs ys

tieneElementosEnComun :: (Eq a) => [[a]] -> Bool
tieneElementosEnComun listaDeListas = not (length (verificaElementosEnComun listaDeListas) == 0)