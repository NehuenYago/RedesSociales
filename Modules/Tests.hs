module Modules.Tests where
import Modules.FuncionesBase
import Modules.FuncionesAuxiliares
import Modules.NombresDeUsuarios
import Modules.AmigosDe
import Modules.CantidadDeAmigos
import Modules.UsuarioConMasAmigos
import Test.HUnit

-- Usuarios
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

-- Creamos una red social para las pruebas
redSocial :: RedSocial
redSocial = ([usuario1, usuario2, usuario3, usuario4, usuario5], 
             [((1, "Juan"), (2, "Natalia")), 
              ((1, "Juan"), (3, "Pedro")),
              ((2, "Natalia"), (4, "Mariela")),
              ((4, "Mariela"), (5, "Natalia"))], 
             [])



testNombresDeUsuarios :: Test
testNombresDeUsuarios = test [
  "Extraer nombres de usuarios de una red vacía" ~:
    nombresDeUsuarios ([],[],[]) ~?= [],
  "Extraer nombres de usuarios de una red con un usuario" ~:
    nombresDeUsuarios ([(1, "Juan")], [], []) ~?= ["Juan"],
  "Extraer nombres de usuarios de una red con varios usuarios" ~:
    nombresDeUsuarios ([(1, "Juan"), (2, "Natalia"), (3, "Pedro")], [], []) ~?= ["Juan", "Natalia", "Pedro"]
  ]

runTestNombresDeUsuarios = runTestTT testNombresDeUsuarios


-- Probamos la función cantidadDeAmigos con distintos usuarios en la red social
testCantidadDeAmigos :: Test
testCantidadDeAmigos = test [
    "Cantidad de amigos de Juan" ~: cantidadDeAmigos redSocial (1, "Juan") ~?= 2,
    "Cantidad de amigos de Natalia" ~: cantidadDeAmigos redSocial (2, "Natalia") ~?= 2,
    "Cantidad de amigos de Pedro" ~: cantidadDeAmigos redSocial (3, "Pedro") ~?= 1,
    "Cantidad de amigos de Mariela" ~: cantidadDeAmigos redSocial (4, "Mariela") ~?= 1,
    "Cantidad de amigos de Natalia" ~: cantidadDeAmigos redSocial (5, "Natalia") ~?= 0
  ]

runTestCantidadDeAmigos = runTestTT testCantidadDeAmigos

-- Probamos la función usuarioConMasAmigos con la red social
testUsuarioConMasAmigos :: Test
testUsuarioConMasAmigos = test [
    "Usuario con más amigos" ~: usuarioConMasAmigos redSocial ~?= (2, "Natalia")
  ]

runTestUsuarioConMasAmigos = runTestTT testUsuarioConMasAmigos