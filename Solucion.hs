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

-- devuelve una lista con los nombres de usuario de los usuarios de una red
nombresDeUsuarios :: RedSocial -> [String]
nombresDeUsuarios red = eliminarRepetidos (extraeNombresDeUsuario (usuarios red))

extraeNombresDeUsuario :: [Usuario] -> [String]
extraeNombresDeUsuario [] = []
extraeNombresDeUsuario (x:xs) = nombreDeUsuario x : extraeNombresDeUsuario xs 

-- describir qué hace la función: .....
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

-- devuelve la longitud de la lista de  amigos del usuario, por lo que entonces devuelve la cantidad de amigos del usuario
cantidadDeAmigos :: RedSocial -> Usuario -> Int
cantidadDeAmigos red u = longitud (amigosDe red u)

-- devuelve el usuario de una red con la mayor cantidad de amigos
usuarioConMasAmigos :: RedSocial -> Usuario
usuarioConMasAmigos ([], _, _) = error "La red social no tiene usuarios"
usuarioConMasAmigos (u : us, rels, pubs) = maximaCantidadDeAmigos (cantidadDeAmigosPorUsuario (u : us, rels, pubs))

-- necesito relacionar cantidad de amigos con usuarios -> lista de tupla (cantidadDeAmigos u, u)
cantidadDeAmigosPorUsuario :: RedSocial -> [(Int, Usuario)]
cantidadDeAmigosPorUsuario ([], _, _) = []
cantidadDeAmigosPorUsuario ([u], rels, pubs) = [(cantidadDeAmigos ([u], rels, pubs) u, u)]
cantidadDeAmigosPorUsuario (u : us, rels, pubs) = (cantidadDeAmigos (u : us, rels, pubs) u, u) : cantidadDeAmigosPorUsuario (us, rels, pubs)

-- tomando la lista de tuplas de arriba busco el elemento con maxima cantidad de amigos y retorno el Usuario correspondiente
maximaCantidadDeAmigos :: [(Int, Usuario)] -> Usuario
maximaCantidadDeAmigos [] = error "La lista de tuplas está vacía"
maximaCantidadDeAmigos [(_, u)] = u
maximaCantidadDeAmigos ((n1, u1) : (n2, u2) : xs)
    | n1 > n2 = maximaCantidadDeAmigos ((n1, u1) : xs)
    | otherwise = maximaCantidadDeAmigos ((n2, u2) : xs)

-- describir qué hace la función: .....
estaRobertoCarlos :: RedSocial -> Bool
estaRobertoCarlos = undefined

-- describir qué hace la función: .....
publicacionesDe :: RedSocial -> Usuario -> [Publicacion]
publicacionesDe = undefined

-- describir qué hace la función: .....
publicacionesQueLeGustanA :: RedSocial -> Usuario -> [Publicacion]
publicacionesQueLeGustanA = undefined

-- describir qué hace la función: .....
lesGustanLasMismasPublicaciones :: RedSocial -> Usuario -> Usuario -> Bool
lesGustanLasMismasPublicaciones = undefined

-- describir qué hace la función: .....
tieneUnSeguidorFiel :: RedSocial -> Usuario -> Bool
tieneUnSeguidorFiel = undefined

-- describir qué hace la función: .....
existeSecuenciaDeAmigos :: RedSocial -> Usuario -> Usuario -> Bool
existeSecuenciaDeAmigos = undefined

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
