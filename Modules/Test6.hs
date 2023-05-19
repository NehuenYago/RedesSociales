-- Template para archivos de testing
module Modules.Test6 where

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

usuario6_1 = (1, "Juan")
usuario6_2 = (2, "Natalia")
usuario6_3 = (3, "Tagliafico")
usuario6_4 = (4, "Mariela")
usuario6_5 = (5, "Natalia")
usuario6_6 = (6, "Tomas")
usuario6_7 = (7, "De Paul")
usuario6_8 = (8, "Lucas")
usuario6_9 = (9, "Julian")
usuario6_10 = (10, "Lionel")
usuario6_11 = (11, "Fideo")
usuario6_12 = (12, "Julio")

relacion6_1_2 = (usuario6_1, usuario6_2)
relacion6_1_3 = (usuario6_1, usuario6_3)
relacion6_1_4 = (usuario6_1, usuario6_4)
relacion6_1_5 = (usuario6_1, usuario6_5)
relacion6_1_6 = (usuario6_1, usuario6_6)
relacion6_1_7 = (usuario6_1, usuario6_7)
relacion6_1_8 = (usuario6_1, usuario6_8)
relacion6_1_9 = (usuario6_1, usuario6_9)
relacion6_1_10 = (usuario6_1, usuario6_10)
relacion6_1_11 = (usuario6_1, usuario6_11)
relacion6_1_12 = (usuario6_1, usuario6_12)
relacion6_2_6 = (usuario6_2, usuario6_6)
relacion6_2_7 = (usuario6_2, usuario6_7)
relacion6_2_8 = (usuario6_2, usuario6_8)
relacion6_2_9 = (usuario6_2, usuario6_9)
relacion6_2_10 = (usuario6_2, usuario6_10)
relacion6_2_11 = (usuario6_2, usuario6_11)
relacion6_2_12 = (usuario6_2, usuario6_12)

publicacion6_1 = (usuario6_1,"Hola!!!",[usuario6_2,usuario6_3])
publicacion6_2 = (usuario6_2,"MUCHAAAAAACHOSSSS",[usuario6_1])
publicacion6_2_2 = (usuario6_2,"Estoy haciendo un test",[usuario6_7])
publicacion6_2_3 = (usuario6_2,"Test",[usuario6_9])
publicacion6_5 = (usuario6_5,"test!!!",[usuario6_10])
publicacion6_6 = (usuario6_6,"Que bien que deje fisica",[usuario6_1])
publicacion6_7 = (usuario6_7,"",[])
publicacion6_8 = (usuario6_7,"Testt",[])
publicacion6_9 = (usuario6_9,"",[])
publicacion6_10 = (usuario6_7,"Testttt",[usuario6_1,usuario6_5])
publicacion6_11 = (usuario6_7,"Testtttt",[usuario6_1])
publicacion6_12 = (usuario6_7,"Testttttt",[usuario6_2])
publicacion6_13 = (usuario6_7,"Testtttttt",[usuario6_1])

usuarios6 = [usuario6_1, usuario6_2, usuario6_3, usuario6_4, usuario6_5, usuario6_6, usuario6_7, 
 usuario6_8, usuario6_9, usuario6_10, usuario6_11, usuario6_12]

relaciones6 = [relacion6_1_2, relacion6_1_3, relacion6_1_4, relacion6_1_5, relacion6_1_6, relacion6_1_7, 
 relacion6_1_8, relacion6_1_9, relacion6_1_10, relacion6_1_11, relacion6_1_12]

publicaciones6_1 = []
publicaciones6_2 = [publicacion6_2, publicacion6_5, publicacion6_9]
publicaciones6_3 = [publicacion6_2, publicacion6_5, publicacion6_9, publicacion6_7]
publicaciones6_4 = [publicacion6_2, publicacion6_5, publicacion6_9, publicacion6_7, publicacion6_8, publicacion6_10]

red6_1 = (usuarios6, relaciones6, publicaciones6_1)
red6_2 = (usuarios6, relaciones6, publicaciones6_2)
red6_3 = (usuarios6, relaciones6, publicaciones6_3)
red6_4 = (usuarios6, relaciones6, publicaciones6_4)

test6 = test [
    "publicacionesDe red sin publicaciones" ~: publicacionesDe red6_1 usuario6_7 ~?= [],

    "publicacionesDe red sin publicaciones para el usuario dado" ~: publicacionesDe red6_2 usuario6_7 ~?= [],
    
    "publicacionesDe red con una publicacion para el usuario dado" ~: publicacionesDe red6_3 usuario6_7 ~?= [publicacion6_7],
    
    "publicacionesDe red con multiples publicaciones para el usuario dado" ~: publicacionesDe red6_4 usuario6_7 ~?= [publicacion6_7, publicacion6_8, publicacion6_10]
 ]

main = runTestTT test6
