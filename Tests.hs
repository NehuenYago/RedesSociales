module TestSuite where

import Test.HUnit
import Solucion

usuario1 = (1, "Juan")
usuario2 = (2, "Natalia")
usuario3 = (3, "Tagliafico")
usuario4 = (4, "Mariela")
usuario5= (5, "Natalia")
usuario6 = (6, "Tomas")
usuario7 = (7, "De Paul")
usuario8 = (8, "Lucas")
usuario9 = (9, "Julian")
usuario10 = (10, "Lionel")
usuario11 = (11, "Fideo")
usuario12 = (12, "Julio")
usuario13 = (13, "Juan")
usuario14 = (14, "Natalia")

relacion1_2 = (usuario1, usuario2)
relacion1_3 = (usuario1, usuario3)
relacion1_4 = (usuario1, usuario4)
relacion1_5 = (usuario1, usuario5)
relacion1_6 = (usuario1, usuario6)
relacion1_7 = (usuario1, usuario7)
relacion1_8 = (usuario1, usuario8)
relacion1_9 = (usuario1, usuario9)
relacion1_10 = (usuario1, usuario10)
relacion1_11 = (usuario1, usuario11)
relacion1_12 = (usuario1, usuario12)
relacion2_3 = (usuario2, usuario3)
relacion2_5 = (usuario2, usuario5)
relacion2_6 = (usuario2, usuario6)
relacion2_7 = (usuario2, usuario7)
relacion2_8 = (usuario2, usuario8)
relacion2_9 = (usuario2, usuario9)
relacion2_10 = (usuario2, usuario10)
relacion2_11 = (usuario5, usuario11)
relacion2_12 = (usuario2, usuario12)
relacion4_5 = (usuario4, usuario5)

redVacia = ([], [], [])
red1 = ([usuario1, usuario2, usuario3], [], [])
redSoloConUnUsuario = ([usuario1], [], [])
redSoloConUsuariosRepetidos = ([usuario1, usuario2, usuario3, usuario4, usuario13, usuario14], [], [])
redConUsuariosConAmigos = ([usuario1, usuario3, usuario5, usuario6], [relacion1_3, relacion1_5, relacion1_12, relacion2_5], [])
redVariosUsuariosConUnicaRelacion = ([usuario1,usuario2,usuario3],[relacion1_2],[])
redVariosUsuarios = ([usuario1,usuario2,usuario3,usuario4,usuario5],[relacion1_2,relacion1_3,relacion2_3,relacion4_5],[])


main = runTestTT todosLosTests

todosLosTests = test [testNombresDeUsuarios, testAmigosDe, testCantidadDeAmigos, testUsuarioConMasAmigos]

expectAny actual expected = elem actual expected ~? ("expected any of: " ++ show expected ++ "\n but got: " ++ show actual)

testNombresDeUsuarios = test [
    " nombresDeUsuario red vacia" ~: nombresDeUsuarios redVacia ~?= [],

    " nombresDeUsuario red con un solo usuario" ~: nombresDeUsuarios redSoloConUnUsuario ~?= ["Juan"],

    " nombresDeUsuario red con varios usuarios de nombres distintos" ~: nombresDeUsuarios red1 ~?= ["Juan", "Natalia", "Tagliafico"],

    " nombresDeUsuario red con varios usuarios algunos con nombres iguales" ~: nombresDeUsuarios redSoloConUsuariosRepetidos ~?= ["Juan", "Natalia", "Tagliafico", "Mariela"]
 ]

testAmigosDe = test [
    " amigosDe unico usuario de una red" ~: amigosDe redSoloConUnUsuario usuario1 ~?= [],

    " amigosDe usuario en red sin relaciones con ese usuario" ~: amigosDe redConUsuariosConAmigos usuario6 ~?= [],

    " amigosDe usuario con un solo amigo en una red con relaciones" ~: amigosDe redConUsuariosConAmigos usuario3 ~?= [usuario1],

    " amigosDe usuario con multiples amigos en una red con relaciones" ~: amigosDe redConUsuariosConAmigos usuario1 ~?= [usuario3, usuario5, usuario12]
 ]

testCantidadDeAmigos = test [
    " cantidadDeAmigos de unico usuario en la red" ~: cantidadDeAmigos redSoloConUnUsuario usuario1 ~?= 0,
    
    " cantidadDeamigos de usuario sin amigos" ~: cantidadDeAmigos redConUsuariosConAmigos usuario6 ~?= 0,

    " cantidadDeAmigos de usuario con un solo amigo" ~: cantidadDeAmigos redConUsuariosConAmigos usuario3 ~?= 1,

    " cantidadDeAmigos de usuario con multiples amigos" ~: cantidadDeAmigos redConUsuariosConAmigos usuario1 ~?= 3
 ]

testUsuarioConMasAmigos = test [
    "usuarioConMasAmigos unico usuario sin relacion" ~: usuarioConMasAmigos redSoloConUnUsuario ~?= usuario1,

    "usuarioConMasAmigos varios usuarios pero sin relacion" ~: expectAny (usuarioConMasAmigos red1) [usuario1,usuario2,usuario3],
    
    "usuarioConMasAmigos varios usuarios pero unica relacion" ~: expectAny (usuarioConMasAmigos redVariosUsuariosConUnicaRelacion) [usuario1,usuario2],

    "usuarioConMasAmigos varios usuarios con unico mayor cantidad de amigos" ~: usuarioConMasAmigos redConUsuariosConAmigos ~?= usuario1,

    "usuarioConMasAmigos varios usuarios donde varios tienen la mayor cantidad de amigos" ~: expectAny (usuarioConMasAmigos redVariosUsuarios) [usuario1,usuario2,usuario3]
 ]
