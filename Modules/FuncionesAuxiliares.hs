module Modules.FuncionesAuxiliares where

-- funciones que se usan en mas de un ejercicion y/o estan, por ejemplo, en las guias

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

-- devuelve la cantidad de elementos que tiene una lista. (igual a length)
longitud :: [t] -> Int
longitud [] = 0
longitud (_:xs) = 1 + longitud xs

-- devuelve el elemento que se encuentra en la posicion n del array. (igual a !!)
devuelveElemento :: [t] -> Int -> t
devuelveElemento (x:_) 0 = x
devuelveElemento (x:xs) n = devuelveElemento xs (n-1)

-- quita un elemento de una lista
quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar y (x:xs) 
    | y == x = xs
    | otherwise = x : quitar y xs

-- elimina todos los elementos e de la lista (x:xs)
quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos _ [] = []
quitarTodos e (x:xs)
 | e == x = quitarTodos e xs
 | otherwise = x : quitarTodos e xs

-- elimina unicamente los elementos repetidos de la lista
eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos (x:xs) = x : (eliminarRepetidos (quitarTodos x xs))

-- agrega un elemento a una lista y elimina los repetidos que pudiesen existir
agregarSinRepetidos :: (Eq t) => t -> [t] -> [t]
agregarSinRepetidos x xs = eliminarRepetidos (x:xs)

-- concatena dos lista y elimina los repetidos que pudiesen existir
unirSinRepetidos :: (Eq t) => [t] -> [t] -> [t]
unirSinRepetidos xs ys = eliminarRepetidos (xs ++ ys)

-- devuelve el primer elemento de una dupla
primeroDeDupla :: (tx, ty) -> tx
primeroDeDupla (x, y) = x

--devuleve el segundo de una dupla
segundoDeDupla :: (tx, ty) -> ty
segundoDeDupla (x, y) = y
