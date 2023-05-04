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

nombresDeUsuarios :: RedSocial -> [String]
nombresDeUsuarios red = extraeNombresDeUsuario (usuarios red)

extraeNombresDeUsuario :: [Usuario] -> [String]
extraeNombresDeUsuario [] = []
extraeNombresDeUsuario (x:xs) = nombreDeUsuario x : extraeNombresDeUsuario xs    

-- describir qué hace la función: .....
amigosDe :: RedSocial -> Usuario -> [Usuario]
amigosDe = undefined

-- describir qué hace la función: .....
cantidadDeAmigos :: RedSocial -> Usuario -> Int
cantidadDeAmigos = undefined

-- describir qué hace la función: .....
usuarioConMasAmigos :: RedSocial -> Usuario
usuarioConMasAmigos = undefined

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

-- Ejemplos

usuario1 :: Usuario
usuario1 = (1, "Juan")
usuario2 :: Usuario
usuario2 = (2, "Natalia")
usuario3 :: Usuario
usuario3 = (3, "Pedro")
usuario4 :: Usuario
usuario4 = (4, "Mariela")
usuario5 :: Usuario
usuario5 = (5, "Natalia")

relacion1_2 :: Relacion
relacion1_2 = (usuario1, usuario2)
relacion1_3 :: Relacion
relacion1_3 = (usuario1, usuario3)
relacion1_4 :: Relacion
relacion1_4 = (usuario4, usuario1)
relacion2_3 :: Relacion -- Notar que el orden en el que aparecen los usuarios es indistinto
relacion2_3 = (usuario3, usuario2)
relacion2_4 :: Relacion
relacion2_4 = (usuario2, usuario4)
relacion3_4 :: Relacion
relacion3_4 = (usuario4, usuario3)

publicacion1_1 :: Publicacion
publicacion1_1 = (usuario1, "Este es mi primer post", [usuario2, usuario4])
publicacion1_2 :: Publicacion
publicacion1_2 = (usuario1, "Este es mi segundo post", [usuario4])
publicacion1_3 :: Publicacion
publicacion1_3 = (usuario1, "Este es mi tercer post", [usuario2, usuario5])
publicacion1_4 :: Publicacion
publicacion1_4 = (usuario1, "Este es mi cuarto post", [])
publicacion1_5 :: Publicacion
publicacion1_5 = (usuario1, "Este es como mi quinto post", [usuario5])

publicacion2_1 :: Publicacion
publicacion2_1 = (usuario2, "Hello World", [usuario4])
publicacion2_2 :: Publicacion
publicacion2_2 = (usuario2, "Good Bye World", [usuario1, usuario4])

publicacion3_1 :: Publicacion
publicacion3_1 = (usuario3, "Lorem Ipsum", [])
publicacion3_2 :: Publicacion
publicacion3_2 = (usuario3, "dolor sit amet", [usuario2])
publicacion3_3 :: Publicacion
publicacion3_3 = (usuario3, "consectetur adipiscing elit", [usuario2, usuario5])

publicacion4_1 :: Publicacion
publicacion4_1 = (usuario4, "I am Alice. Not", [usuario1, usuario2])
publicacion4_2 :: Publicacion
publicacion4_2 = (usuario4, "I am Bob", [])
publicacion4_3 :: Publicacion
publicacion4_3 = (usuario4, "Just kidding, i am Mariela", [usuario1, usuario3])


usuariosA :: [Usuario]
usuariosA = [usuario1, usuario2, usuario3, usuario4]
relacionesA :: [Relacion]
relacionesA = [relacion1_2, relacion1_4, relacion2_3, relacion2_4, relacion3_4]
publicacionesA :: [Publicacion]
publicacionesA = [publicacion1_1, publicacion1_2, publicacion2_1, publicacion2_2, publicacion3_1, publicacion3_2, publicacion4_1, publicacion4_2]
redA :: RedSocial
redA = (usuariosA, relacionesA, publicacionesA)

usuariosB :: [Usuario]
usuariosB = [usuario1, usuario2, usuario3, usuario5]
relacionesB :: [Relacion]
relacionesB = [relacion1_2, relacion2_3]
publicacionesB :: [Publicacion]
publicacionesB = [publicacion1_3, publicacion1_4, publicacion1_5, publicacion3_1, publicacion3_2, publicacion3_3]
redB :: RedSocial
redB = (usuariosB, relacionesB, publicacionesB)
