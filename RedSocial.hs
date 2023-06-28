module RedSocial where

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
-- Dada una red social devuelve una lista con los nombres de los usuarios sin repetir
nombresDeUsuarios :: RedSocial -> [String]
nombresDeUsuarios red = eliminarRepetidos (extraeNombresDeUsuario (usuarios red))

extraeNombresDeUsuario :: [Usuario] -> [String]
extraeNombresDeUsuario [] = []
extraeNombresDeUsuario (x:xs) = nombreDeUsuario x : extraeNombresDeUsuario xs 

-- Ej 2
-- Dada una red social y un usuario devuelve una lista con los usuarios que 
-- tienen una relacion con dicho usuario
amigosDe :: RedSocial -> Usuario -> [Usuario]
amigosDe (usrs, rels, pubs) us = amigosDeAux rels us 

-- Dada una lista de relaciones y un usuario devuelve una lista con los usuarios
-- que tienen una relacion con dicho usuario 
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
-- Dada una red social y un usuario devuelve la cantidad de usuarios que tienen
-- una relacion con dicho usuario
cantidadDeAmigos :: RedSocial -> Usuario -> Int
cantidadDeAmigos red u = longitud (amigosDe red u)

-- Ej 4
-- Dada una red social devuelve el usuario con la mayor cantidad de amigos
usuarioConMasAmigos :: RedSocial -> Usuario
usuarioConMasAmigos ([], _, _) = error "La red social no tiene usuarios"
usuarioConMasAmigos (u : us, rels, pubs) = maximaCantidadDeAmigos (cantidadDeAmigosPorUsuario (u : us, rels, pubs))

-- Dada una red social devuelve una lista de tuplas donde el segundo elemento 
-- es un usuario de la red y el primer elemento es la cantidad de amigos de ese usuario
cantidadDeAmigosPorUsuario :: RedSocial -> [(Int, Usuario)]
cantidadDeAmigosPorUsuario ([], _, _) = []
cantidadDeAmigosPorUsuario ([u], rels, pubs) = [(cantidadDeAmigos ([u], rels, pubs) u, u)]
cantidadDeAmigosPorUsuario (u : us, rels, pubs) = (cantidadDeAmigos (u : us, rels, pubs) u, u) : cantidadDeAmigosPorUsuario (us, rels, pubs)

-- Dada una lista de tuplas (cantidadDeAmigos, Usuario) devueve el usuario que 
-- tiene la mayor cantidad de amigos
maximaCantidadDeAmigos :: [(Int, Usuario)] -> Usuario
maximaCantidadDeAmigos [] = error "La lista de tuplas está vacía"
maximaCantidadDeAmigos [(_, u)] = u
maximaCantidadDeAmigos ((n1, u1) : (n2, u2) : xs)
    | n1 > n2 = maximaCantidadDeAmigos ((n1, u1) : xs)
    | otherwise = maximaCantidadDeAmigos ((n2, u2) : xs)

-- Ej 5
-- Dada una red social devuelve True si existe un usuario que tenga más de 10 amigos
estaRobertoCarlos :: RedSocial -> Bool
estaRobertoCarlos red = aux (usuarios red)
  where
    aux [] = False
    aux (u:us) = masDeUnMillonDeAmigos red u || aux us

-- Dada una red social y un usuario devuelve True si dicho usuario tiene más de 10 amigos 
masDeUnMillonDeAmigos :: RedSocial -> Usuario -> Bool
masDeUnMillonDeAmigos red u = cantidadDeAmigos red u > 10

-- Ej 6
-- Dada una red social y un usuario devuelve una lista con las publicaciones 
-- que tienen como autor dicho usuario, sin repetidos.
publicacionesDe :: RedSocial -> Usuario -> [Publicacion]
publicacionesDe (us,rels,pubs) u = eliminarRepetidos (publicacionesDeAux pubs u)

-- Dada una lista de publicaciones y un usuario devuelve una lista con las 
-- publicaciones que tienen como autor a dicho usuario
publicacionesDeAux :: [Publicacion] -> Usuario -> [Publicacion]
publicacionesDeAux [] _ = []
publicacionesDeAux ((uPub,text,likes):pubs) u 
    | u == uPub = (uPub,text,likes):publicacionesDeAux pubs u
    | otherwise = publicacionesDeAux pubs u 

-- Ej 7
-- Dada una red social y un usuario devuelve una lista con las publicaciones 
-- que le gustan a dicho usuario, sin repetidos.
publicacionesQueLeGustanA :: RedSocial -> Usuario -> [Publicacion]
publicacionesQueLeGustanA (us,rels,pubs) u = eliminarRepetidos ( publicacionesQueLeGustanAAux pubs u)

-- Dada una lista de publicaciones y un usuario devuelve una lista con las publicaciones 
-- que le gustan a dicho usuario.
publicacionesQueLeGustanAAux :: [Publicacion] -> Usuario -> [Publicacion]
publicacionesQueLeGustanAAux [] _ = []
publicacionesQueLeGustanAAux ((autor,texto,likes):pubs) u 
    | pertenece u likes = (autor,texto,likes) : publicacionesQueLeGustanAAux pubs u
    | otherwise = publicacionesQueLeGustanAAux pubs u

-- Ej 8
-- Dada una red social y dos usuarios devuelve True si a ambos le gustan las
-- mismas pubicaciones
lesGustanLasMismasPublicaciones :: RedSocial -> Usuario -> Usuario -> Bool
lesGustanLasMismasPublicaciones red u1 u2 = mismosElementos (publicacionesQueLeGustanA red u1) (publicacionesQueLeGustanA red u2)

-- Ej 9
-- Dada una red social y un usuario devuelve True si existe algun otro usuario que le 
-- haya dado like a todas las publiaciones del primero
tieneUnSeguidorFiel :: RedSocial -> Usuario -> Bool
tieneUnSeguidorFiel red us = tienenElementosEnComun (remueveAutoLikes (listaDeLikes (publicacionesDe red us)) us)

-- Dada una lista de publicaciones devuelve una lista de las listas de usuarios 
-- que le dieron like a cada publicacion
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

-- Dada una lista de listas, devuelve True si las sublistas tienen al menos un elemento en común.
tienenElementosEnComun :: (Eq a) => [[a]] -> Bool
tienenElementosEnComun listaDeListas = not (longitud (verificaElementosEnComun listaDeListas) == 0)

-- Dada una lista de listas devuelve una lista con los elementos comunes a todas
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

-- Ej 10
-- Dada una red social y dos usuarios devuelve True si ambos están relacionados
-- directamente o a traves de una secuencia de amigos. 
existeSecuenciaDeAmigos :: RedSocial -> Usuario -> Usuario -> Bool
existeSecuenciaDeAmigos red us1 us2
    | pertenece us2 (circuloDeAmigos red us1) = True 
    | otherwise = False

-- Dada una red social y un usuario devuelve una lista de usuarios relacionados 
-- a este directamente o a traves de otros usuarios. 
circuloDeAmigos :: RedSocial -> Usuario -> [Usuario]
circuloDeAmigos red us = expandirCirculoDeAmigos red [us] []

-- Dada una red social y dos listas de usuarios, aExpandir y expandidos, devuelve
-- una lista de usuarios relacionados a los de la primera lista, ya sea mediante
-- relaciones directas o a traves de otros usuarios.
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

-- Funciones que se usan en mas de un ejercicion y/o estan, por ejemplo, en las guias

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
