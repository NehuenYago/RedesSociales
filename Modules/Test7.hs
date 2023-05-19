-- Template para archivos de testing
module Modules.Test7 where

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

-- Definir variables propias del test
usuario7_1 = (1, "Juan")
usuario7_2 = (2, "Natalia")
usuario7_3 = (3, "Tagliafico")
usuario7_4 = (4, "Mariela")
usuario7_5 = (5, "Natalia")
usuario7_6 = (6, "Tomas")
usuario7_7 = (7, "De Paul")
usuario7_8 = (8, "Lucas")
usuario7_9 = (9, "Julian")
usuario7_10 = (10, "Lionel")
usuario7_11 = (11, "Fideo")
usuario7_12 = (12, "Julio")

publicacion7_1 = (usuario7_1,"Hola!!!",[usuario7_2,usuario7_3])
publicacion7_2 = (usuario7_2,"MUCHAAAAAACHOSSSS",[usuario7_1])
publicacion7_2_2 = (usuario7_2,"Estoy haciendo un test",[usuario7_7])
publicacion7_2_3 = (usuario7_2,"Test",[usuario7_9])
publicacion7_5 = (usuario7_5,"test!!!",[usuario7_10])
publicacion7_6 = (usuario7_6,"Que bien que deje fisica",[usuario7_1])
publicacion7_7 = (usuario7_7,"",[])
publicacion7_8 = (usuario7_7,"Testt",[])
publicacion7_9 = (usuario7_9,"",[])
publicacion7_10 = (usuario7_7,"Testttt",[usuario7_1,usuario7_5])
publicacion7_11 = (usuario7_7,"Testtttt",[usuario7_1])
publicacion7_12 = (usuario7_7,"Testttttt",[usuario7_2])
publicacion7_13 = (usuario7_7,"Testtttttt",[usuario7_1])

usuarios7 = [usuario7_1, usuario7_2, usuario7_3, usuario7_4, usuario7_5, usuario7_6, usuario7_7, 
           usuario7_8, usuario7_9, usuario7_10, usuario7_11, usuario7_12]

relaciones7 = []

publicaciones7_1 = []
publicaciones7_2 = [publicacion7_1]
publicaciones7_3 = [publicacion7_2]
publicaciones7_4 = [publicacion7_1,publicacion7_2_2]
publicaciones7_5 = [publicacion7_1,publicacion7_2_2,publicacion7_2]
publicaciones7_6 = [publicacion7_1,publicacion7_2_2,publicacion7_2,publicacion7_10]

red7_1 = (usuarios7, relaciones7, publicaciones7_1)
red7_2 = (usuarios7, relaciones7, publicaciones7_2)
red7_3 = (usuarios7, relaciones7, publicaciones7_3)
red7_4 = (usuarios7, relaciones7, publicaciones7_4)
red7_5 = (usuarios7, relaciones7, publicaciones7_5)
red7_6 = (usuarios7, relaciones7, publicaciones7_6)

-- Casos de test
test7 :: Test
test7 = test
    [ 
    "Red " ~: publicacionesQueLeGustanA red7_1 usuario1 ~?= [],
    "Red " ~: publicacionesQueLeGustanA red7_2 usuario1 ~?= [],
    "Red " ~: publicacionesQueLeGustanA red7_3 usuario1 ~?= [publicacion7_2],
    "Red " ~: publicacionesQueLeGustanA red7_4 usuario1 ~?= [],
    "Red " ~: publicacionesQueLeGustanA red7_5 usuario1 ~?= [publicacion7_2],
    "Red " ~: publicacionesQueLeGustanA red7_6 usuario1 ~?= [publicacion7_2, publicacion7_10]
 ]

main = runTestTT test7
