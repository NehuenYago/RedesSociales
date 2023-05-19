module Solucion where

-- Completar con los datos del grupo
--
-- Nombre de Grupo: Algorritmos
-- Integrante 1: Nombre Apellido, email, LU
-- Integrante 2: Nombre Apellido, email, LU
-- Integrante 3: Nombre Apellido, email, LU
-- Integrante 4: Nombre Apellido, email, LU

type Usuario = (Integer, String) -- (id, nombre)
type Relacion = (Usuario, Usuario) -- usuarios que se relacionan
type Publicacion = (Usuario, String, [Usuario]) -- (usuario que publica, texto publicacion, likes)
type RedSocial = ([Usuario], [Relacion], [Publicacion])

-- Funciones basicas

usuarios :: RedSocial -> [Usuario]
usuarios (us, _, _) = us

relaciones :: RedSocial -> [Relacion]
relaciones (_, rs, _) = rs

publicaciones :: RedSocial -> [Publicacion]
publicaciones (_, _, ps) = ps

idDeUsuario :: Usuario -> Integer
idDeUsuario (id, _) = id 

nombreDeUsuario :: Usuario -> String
nombreDeUsuario (_, nombre) = nombre 

usuarioDePublicacion :: Publicacion -> Usuario
usuarioDePublicacion (u, _, _) = u

likesDePublicacion :: Publicacion -> [Usuario]
likesDePublicacion (_, _, us) = us

-- Ejercicios

-- Ej 1
-- Devuelve una lista con los nombres de usuario de los usuarios de una red
nombresDeUsuarios :: RedSocial -> [String]
nombresDeUsuarios red = eliminarRepetidos (extraeNombresDeUsuario (usuarios red))

extraeNombresDeUsuario :: [Usuario] -> [String]
extraeNombresDeUsuario [] = []
extraeNombresDeUsuario (x:xs) = nombreDeUsuario x : extraeNombresDeUsuario xs 

-- Ej 2
-- Devuelve una lista con los usuarios que tienen relaciones con el usuario dado
-- en la red dada
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

-- Ej 3
-- Devuelve la cantidad de usuarios que tienen relaciones con el usuario dado
-- en la red dada
cantidadDeAmigos :: RedSocial -> Usuario -> Int
cantidadDeAmigos red u = longitud (amigosDe red u)

-- Ej 4
-- Devuelve el usuario con la mayor cantidad de amigos en una red dada
usuarioConMasAmigos :: RedSocial -> Usuario
usuarioConMasAmigos ([], _, _) = error "La red social no tiene usuarios"
usuarioConMasAmigos (u : us, rels, pubs) = maximaCantidadDeAmigos (cantidadDeAmigosPorUsuario (u : us, rels, pubs))

-- Devuelve una lista de tuplas donde el segundo elemento es un usuario de la red
-- y el primer elemento es la cantidad de amigos de ese usuario
cantidadDeAmigosPorUsuario :: RedSocial -> [(Int, Usuario)]
cantidadDeAmigosPorUsuario ([], _, _) = []
cantidadDeAmigosPorUsuario ([u], rels, pubs) = [(cantidadDeAmigos ([u], rels, pubs) u, u)]
cantidadDeAmigosPorUsuario (u : us, rels, pubs) = (cantidadDeAmigos (u : us, rels, pubs) u, u) : cantidadDeAmigosPorUsuario (us, rels, pubs)

-- Devuelve el usuario con la mayor cantidad de amigos dada una lista de tuplas (cantidadDeAmigos, Usuario)
maximaCantidadDeAmigos :: [(Int, Usuario)] -> Usuario
maximaCantidadDeAmigos [] = error "La lista de tuplas está vacía"
maximaCantidadDeAmigos [(_, u)] = u
maximaCantidadDeAmigos ((n1, u1) : (n2, u2) : xs)
    | n1 > n2 = maximaCantidadDeAmigos ((n1, u1) : xs)
    | otherwise = maximaCantidadDeAmigos ((n2, u2) : xs)

-- Ej 5
-- Devuelve True si en la red dada existe un usuario que tenga más de 10 amigos
estaRobertoCarlos :: RedSocial -> Bool
estaRobertoCarlos red = aux (usuarios red)
  where
    aux [] = False
    aux (u:us) = masDeUnMillonDeAmigos red u || aux us

-- Devlueve True si el usuario dado en la red dada tiene más de 10 amigos 
masDeUnMillonDeAmigos :: RedSocial -> Usuario -> Bool
masDeUnMillonDeAmigos red u = cantidadDeAmigos red u > 10

-- Ej 6
-- Devuelve una lista con las publicaciones que tienen como autor el usuario
-- en la red dada
publicacionesDe :: RedSocial -> Usuario -> [Publicacion]
publicacionesDe (us,rels,pubs) u = eliminarRepetidos (publicacionesDeAux pubs u)

-- Devuelve una lsita con las publicaciones de la lista de publicaciones dada
-- que tienen como autor el usuario dado
publicacionesDeAux :: [Publicacion] -> Usuario -> [Publicacion]
publicacionesDeAux [] _ = []
publicacionesDeAux ((uPub,text,likes):pubs) u 
    | u == uPub = (uPub,text,likes):publicacionesDeAux pubs u
    | otherwise = publicacionesDeAux pubs u 

-- Ej 7
-- Devuelve una lista con las publicaciones de la red dada que en sus lista de
-- usuarios que le dieron like se encuentra el usuario dado
publicacionesQueLeGustanA :: RedSocial -> Usuario -> [Publicacion]
publicacionesQueLeGustanA (us,rels,pubs) u = eliminarRepetidos ( publicacionesQueLeGustanAAux pubs u)

-- Devuelve una lista con las publicaciones dadas que en sus lista de
-- usuarios que le dieron like se encuentra el usuario dado
publicacionesQueLeGustanAAux :: [Publicacion] -> Usuario -> [Publicacion]
publicacionesQueLeGustanAAux [] _ = []
publicacionesQueLeGustanAAux ((autor,texto,likes):pubs) u 
    | pertenece u likes = (autor,texto,likes) : publicacionesQueLeGustanAAux pubs u
    | otherwise = publicacionesQueLeGustanAAux pubs u

-- Ej 8
-- Devuelve True si los dos usuarios dados se encuentran en las mismas listas 
-- de usuarios que le dieron like de las publicaciones de la red
lesGustanLasMismasPublicaciones :: RedSocial -> Usuario -> Usuario -> Bool
lesGustanLasMismasPublicaciones red u1 u2 = mismosElementos (publicacionesQueLeGustanA red u1) (publicacionesQueLeGustanA red u2)

-- Ej test9
-- Devuelve True si existe en la red dada un usuario que le haya dado like 
-- a todas las publiaciones del usuario dado
tieneUnSeguidorFiel :: RedSocial -> Usuario -> Bool
tieneUnSeguidorFiel red us = tieneElementosEnComun (remueveAutoLikes (listaDeLikes (publicacionesDe red us)) us)

-- Devuelve una lista de listas de usuarios que le dieron like a las publicaciones
-- en la lista de publicaciones dada
listaDeLikes :: [Publicacion] -> [[Usuario]]
listaDeLikes [] = []
listaDeLikes [(_, _, lk)] = [lk]
listaDeLikes ((_, _, lk) : xs) = lk : listaDeLikes xs

-- Saca de las listas de like al autor de la publicacion
remueveAutoLikes :: [[Usuario]] -> Usuario -> [[Usuario]]
remueveAutoLikes [] u = []
remueveAutoLikes (x:xs) u 
    | pertenece u x = quitar u x : remueveAutoLikes xs u
    | otherwise = x:remueveAutoLikes xs u

-- Ej 10
-- Devuelve True si en una red dada los usuarios dados están relacionados
-- mediante relaciones directas o indirectas de cualquier grado. 
existeSecuenciaDeAmigos :: RedSocial -> Usuario -> Usuario -> Bool
existeSecuenciaDeAmigos red us1 us2
    | pertenece us2 (circuloDeAmigos red us1) = True 
    | otherwise = False

-- Devuelve una lista de usuarios relacionados con el usuario dado mediante 
-- relaciones directas o indirectas de cualquier grado  
circuloDeAmigos :: RedSocial -> Usuario -> [Usuario]
circuloDeAmigos red us = expandirCirculoDeAmigos red [us] []

-- Dada una lista de usuarios aExpandir recuarsivamente concatena al resultado
-- los amigos de los usuarios aExpandir. En cada recursión además se agregan 
-- dichos amigos a la lista aExpandir, y el usuario expandido a la lista expandidos.
expandirCirculoDeAmigos :: RedSocial -> [Usuario] -> [Usuario] -> [Usuario]
expandirCirculoDeAmigos red [] expandidos = []
expandirCirculoDeAmigos red aExpandir expandidos 
    | pertenece us expandidos = expandirCirculoDeAmigos red aExpandirSinUs expandidos 
    | otherwise = unirSinRepetidos (amigosDe red us) (expandirCirculoDeAmigos red aExpandirSinUsConAmigos expandidosConUs)
    where 
        us = head aExpandir
        aExpandirSinUs = tail aExpandir
        aExpandirSinUsConAmigos = unirSinRepetidos aExpandirSinUs (amigosDe red us)
        expandidosConUs = agregarSinRepetidos us expandidos

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

-- elimina todos los elementos e de la lista (x:xs)
quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos _ [] = []
quitarTodos e (x:xs)
 | e == x = quitarTodos e xs
 | otherwise = x : quitarTodos e xs

-- quita un elemento de una lista
quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar y (x:xs) 
    | y == x = xs
    | otherwise = x : quitar y xs

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

-- Toma una lista de listas y devuelve una lista con los elementos comunes a todas
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

-- Devuelve veradero si dada una lista de listas, las sublistas tienen al menos un elemento en común.
tieneElementosEnComun :: (Eq a) => [[a]] -> Bool
tieneElementosEnComun listaDeListas = not (longitud (verificaElementosEnComun listaDeListas) == 0)
