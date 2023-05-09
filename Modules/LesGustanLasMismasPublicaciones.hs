module Modules.LesGustanLasMismasPublicaciones where
import Modules.FuncionesBase
import Modules.PublicacionesQueLeGustanA

-- dada una red social y dos usuarios de la misma quiero saber si les gustan las mismas publicaciones
-- puedo usar la funcion publicacionesQueLeGustanA que dado un usuario me devuelve la lista de publicaciones a la cual le dio like
-- pasandole a esta funcion los usuarios deseados obengo dos listas de publicaciones, las cuales puedo ver si tienen los mismos elementos

lesGustanLasMismasPublicaciones :: RedSocial -> Usuario -> Usuario -> Bool
lesGustanLasMismasPublicaciones red u1 u2 = mismosElementos (publicacionesQueLeGustanA red u1) (publicacionesQueLeGustanA red u2)

-- ve si dos listas tienen los mismos elementos
mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos xs ys = todosPertenecen xs ys && todosPertenecen ys xs

-- ve si los elementos de una lista pertenecen en su totalidad a otra lista
todosPertenecen :: (Eq t) => [t] -> [t] -> Bool
todosPertenecen [] _ = True
todosPertenecen (x:xs) ys = pertenece x ys && todosPertenecen xs ys

pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece y (x:xs) 
    | y == x = True
    | otherwise = pertenece y xs
