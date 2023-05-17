-- Template para archivos de testing
module Modules.Test5 where

-- Funciones y ejemplos
import Modules.FuncionesBase
import Modules.FuncionesAuxiliares
import Modules.Ejemplos

-- implementaciones
import Modules.AmigosDe
import Modules.NombresDeUsuarios
import Modules.CantidadDeAmigos
import Modules.UsuarioConMasAmigos
import Modules.EstaRobertoCarlos
import Modules.PublicacionesDe
import Modules.PublicacionesQueLeGustanA
import Modules.LesGustanLasMismasPublicaciones
import Modules.ExisteSecuenciaDeAmigos
import Modules.TieneUnSeguidorFiel

import Test.HUnit

usuario5_1 = (1, "Juan")
usuario5_2 = (2, "Natalia")
usuario5_3 = (3, "Tagliafico")
usuario5_4 = (4, "Mariela")
usuario5_5 = (5, "Natalia")
usuario5_6 = (6, "Tomas")
usuario5_7 = (7, "De Paul")
usuario5_8 = (8, "Lucas")
usuario5_9 = (9, "Julian")
usuario5_10 = (10, "Lionel")
usuario5_11 = (11, "Fideo")
usuario5_12 = (12, "Julio")

relacion5_1_2 = (usuario5_1, usuario5_2)
relacion5_1_3 = (usuario5_1, usuario5_3)
relacion5_1_4 = (usuario5_1, usuario5_4)
relacion5_1_5 = (usuario5_1, usuario5_5)
relacion5_1_6 = (usuario5_1, usuario5_6)
relacion5_1_7 = (usuario5_1, usuario5_7)
relacion5_1_8 = (usuario5_1, usuario5_8)
relacion5_1_9 = (usuario5_1, usuario5_9)
relacion5_1_10 = (usuario5_1, usuario5_10)
relacion5_1_11 = (usuario5_1, usuario5_11)
relacion5_1_12 = (usuario5_1, usuario5_12)
relacion5_2_6 = (usuario5_2, usuario5_6)
relacion5_2_7 = (usuario5_2, usuario5_7)
relacion5_2_8 = (usuario5_2, usuario5_8)
relacion5_2_9 = (usuario5_2, usuario5_9)
relacion5_2_10 = (usuario5_2, usuario5_10)
relacion5_2_11 = (usuario5_2, usuario5_11)
relacion5_2_12 = (usuario5_2, usuario5_12)

usuarios12 = [usuario5_1, usuario5_2, usuario5_3, usuario5_4, usuario5_5, usuario5_6, usuario5_7, 
 usuario5_8, usuario5_9, usuario5_10, usuario5_11, usuario5_12]

amigos11 = [relacion5_1_2, relacion5_1_3, relacion5_1_4, relacion5_1_5, relacion5_1_6, relacion5_1_7, 
 relacion5_1_8, relacion5_1_9, relacion5_1_10, relacion5_1_11, relacion5_1_12]

relaciones11 = [relacion5_1_2, relacion5_1_3, relacion5_1_4, relacion5_1_5, relacion5_2_6, relacion5_2_7, 
 relacion5_2_8, relacion5_2_9, relacion5_2_10, relacion5_2_11, relacion5_2_12]

amigos10 = [relacion5_1_2, relacion5_1_3, relacion5_1_4, relacion5_1_5, relacion5_1_6, relacion5_1_7, 
 relacion5_1_8, relacion5_1_9, relacion5_1_10]

redRobertoCarlos = (usuarios12, amigos11, [])
redVacia = ([],[],[])
redSinRelaciones = (usuarios12,[],[])
redPocosAmigos = (usuarios12, [relacion5_1_2, relacion5_1_3, relacion5_1_4], [])
redDiezAmigos = (usuarios12, amigos10, [])
redOnceRelaciones = (usuarios12, relaciones11, [])

test5 = test [
    "estaRobertoCarlos red sin usuarios" ~: estaRobertoCarlos redVacia ~?= False,

    "estaRobertoCarlos red con 12 usuarios sin relaciones" ~: estaRobertoCarlos redSinRelaciones ~?= False,

    "estaRobertoCarlos red con 12 usuarios pero <10 amigos" ~: estaRobertoCarlos redPocosAmigos ~?= False,

    "estaRobertoCarlos red con 12 usuarios y 10 amigos" ~: estaRobertoCarlos redDiezAmigos ~?= False,

    "estaRobertoCarlos red con 12 usuarios y 11 relaciones" ~: estaRobertoCarlos redOnceRelaciones ~?= False,

    "estaRobertoCarlos re con 12 usuarios y 11 amigos" ~: estaRobertoCarlos redRobertoCarlos ~?= True
 ]

main = runTestTT test5