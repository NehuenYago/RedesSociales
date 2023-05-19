-- Template para archivos de testing
module Modules.TestN where

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
usuario8_1 = (1, "Juan")
usuario8_2 = (2, "Natalia")
usuario8_3 = (3, "Tagliafico")
usuario8_4 = (4, "Mariela")
usuario8_5 = (5, "Natalia")
usuario8_6 = (6, "Tomas")
usuario8_7 = (7, "De Paul")
usuario8_8 = (8, "Lucas")
usuario8_9 = (9, "Julian")
usuario8_10 = (10, "Lionel")
usuario8_11 = (11, "Fideo")
usuario8_12 = (12, "Julio")

publicacion8_1 = (usuario8_1,"Hola!!!",[usuario8_2,usuario8_3])
publicacion8_2 = (usuario8_2,"MUCHAAAAAACHOSSSS",[usuario8_1])
publicacion8_2_2 = (usuario8_2,"Estoy haciendo un test",[usuario8_7])
publicacion8_2_3 = (usuario8_2,"Test",[usuario8_9])
publicacion8_5 = (usuario8_5,"test!!!",[usuario8_10])
publicacion8_6 = (usuario8_6,"Que bien que deje fisica",[usuario8_1])
publicacion8_7 = (usuario8_7,"",[])
publicacion8_8 = (usuario8_7,"Testt",[])
publicacion8_9 = (usuario8_9,"",[usuario8_5])
publicacion8_10 = (usuario8_7,"Testttt",[usuario8_1,usuario8_5])
publicacion8_11 = (usuario8_7,"Testtttt",[usuario8_1])
publicacion8_12 = (usuario8_7,"Testttttt",[usuario8_2])
publicacion8_13 = (usuario8_7,"Testtttttt",[usuario8_1,usuario8_5])

usuarios8 = [usuario8_1, usuario8_2, usuario8_3, usuario8_4, usuario8_5, usuario8_6, usuario8_7, 
           usuario8_8, usuario8_9, usuario8_10, usuario8_11, usuario8_12]

relaciones8 = []

publicaciones8_1 = []
publicaciones8_2 = [publicacion8_10]
publicaciones8_3 = [publicacion8_2]
publicaciones8_4 = [publicacion8_1,publicacion8_9]
publicaciones8_5 = [publicacion8_10,publicacion8_13]

red8_1 = (usuarios8, relaciones8, publicaciones8_1)
red8_2 = (usuarios8, relaciones8, publicaciones8_2)
red8_3 = (usuarios8, relaciones8, publicaciones8_3)
red8_4 = (usuarios8, relaciones8, publicaciones8_4)
red8_5 = (usuarios8, relaciones8, publicaciones8_5)

-- Casos de test
test8 :: Test
test8 = test
    [ 
    "Red " ~: lesGustanLasMismasPublicaciones red8_1 usuario1 usuario5 ~?= True,
    "Red " ~: lesGustanLasMismasPublicaciones red8_2 usuario1 usuario5 ~?= True,
    "Red " ~: lesGustanLasMismasPublicaciones red8_3 usuario1 usuario5 ~?= False,
    "Red " ~: lesGustanLasMismasPublicaciones red8_4 usuario1 usuario5 ~?= False,
    "Red " ~: lesGustanLasMismasPublicaciones red8_5 usuario1 usuario5 ~?= True
 ]


main = runTestTT test8
