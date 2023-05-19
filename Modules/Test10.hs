-- Template para archivos de testing
module Modules.Test10 where

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

usuario10_1 = (1, "Juan")
usuario10_2 = (2, "Natalia")
usuario10_3 = (3, "Tagliafico")
usuario10_4 = (4, "Mariela")
usuario10_5 = (5, "Natalia")
usuario10_6 = (6, "Tomas")
usuario10_7 = (7, "De Paul")
usuario10_8 = (8, "Lucas")
usuario10_9 = (9, "Julian")
usuario10_10 = (10, "Lionel")
usuario10_11 = (11, "Fideo")
usuario10_12 = (12, "Julio")

relacion10_1_2 = (usuario10_1, usuario10_2)
relacion10_2_3 = (usuario10_2, usuario10_3)
relacion10_3_5 = (usuario10_3, usuario10_5)
relacion10_6_12 = (usuario10_6, usuario10_12)
relacion10_1_12 = (usuario10_1, usuario10_12)
relacion10_5_12 = (usuario10_5, usuario10_12)

publicacion10_1 = (usuario10_1,"Hola!!!",[usuario10_2,usuario10_3])

usuarios10 = [usuario10_1, usuario10_2, usuario10_3, usuario10_4, usuario10_5, usuario10_6, usuario10_7, 
 usuario10_8, usuario10_9, usuario10_10, usuario10_11, usuario10_12]

relaciones10_1 = []
relaciones10_2 = [relacion10_1_2]
relaciones10_3 = [relacion10_1_12]
relaciones10_4 = [relacion10_1_2, relacion10_2_3, relacion10_3_5]
relaciones10_5 = [relacion10_1_2, relacion10_2_3, relacion10_3_5, relacion10_6_12]
relaciones10_6 = [relacion10_1_2, relacion10_2_3, relacion10_3_5, relacion10_1_12]
relaciones10_7 = [relacion10_1_2, relacion10_2_3, relacion10_3_5, relacion10_5_12]

publicaciones10 = [publicacion10_1, publicacion10_1]

red10_1 = (usuarios10, relaciones10_1, publicaciones10)
red10_2 = (usuarios10, relaciones10_2, publicaciones10)
red10_3 = (usuarios10, relaciones10_3, publicaciones10)
red10_4 = (usuarios10, relaciones10_4, publicaciones10)
red10_5 = (usuarios10, relaciones10_5, publicaciones10)
red10_6 = (usuarios10, relaciones10_6, publicaciones10)
red10_7 = (usuarios10, relaciones10_7, publicaciones10)

test10 = test [
    "Red sin relaciones" ~: existeSecuenciaDeAmigos red10_1 usuario10_1 usuario10_12 ~?= False,
    "Red con una relacion, sin los usuarios dados" ~: existeSecuenciaDeAmigos red10_2 usuario10_1 usuario10_12 ~?= False,
    "Red con una relacion directa entre los usuarios dados" ~: existeSecuenciaDeAmigos red10_3 usuario10_1 usuario10_12 ~?= True,
    "Red con multiples relaciones, uno de los usuarios dados no tiene relaciones" ~: existeSecuenciaDeAmigos red10_4 usuario10_1 usuario10_12 ~?= False,
    "Red con multiples relaciones, sin relacion directa o indirecta entre los usuarios dados" ~: existeSecuenciaDeAmigos red10_5 usuario10_1 usuario10_12 ~?= False,
    "Red con multiples relacioens, con una relaciones directa entre los usuarios dados" ~: existeSecuenciaDeAmigos red10_6 usuario10_1 usuario10_12 ~?= True,
    "Red con multiples relaciones, con una relacion indirecta entre los usuarios dados" ~: existeSecuenciaDeAmigos red10_7 usuario10_1 usuario10_12 ~?= True
 ]

main = runTestTT test10
