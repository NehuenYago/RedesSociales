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

-- Ejemplos
usuario2_1 = (1, "Juan")
usuario2_2 = (2, "Natalia")
usuario2_3 = (3, "Pedro")
usuario2_4 = (4, "Mariela")
usuario2_5 = (5, "Natalia")
usuario2_6 = (6, "Juan")

relacion2_1_2 = (usuario2_1, usuario2_2)
relacion2_1_3 = (usuario2_1, usuario2_3)
relacion2_1_4 = (usuario2_1, usuario2_4)
relacion2_1_5 = (usuario2_1, usuario2_5)
relacion2_1_6 = (usuario2_1, usuario2_6)
relacion2_2_3 = (usuario2_2, usuario2_3)
relacion2_2_4 = (usuario2_2, usuario2_4)
relacion2_2_5 = (usuario2_2, usuario2_5)
relacion2_2_6 = (usuario2_2, usuario2_6)
relacion2_3_4 = (usuario2_3, usuario2_4)
relacion2_3_5 = (usuario2_3, usuario2_5)
relacion2_3_6 = (usuario2_3, usuario2_6)
relacion2_4_5 = (usuario2_4, usuario2_5)
relacion2_4_6 = (usuario2_4, usuario2_6)
relacion2_5_6 = (usuario2_5, usuario2_6)

redConUnSoloUsuario2 = ([usuario2_1], [], []) 
red2 = ([usuario2_1, usuario2_3, usuario2_5, usuario2_6], [relacion2_1_3, relacion2_1_5, relacion2_2_5], [])

test2 = test [
    " amigosDe unico usuario de una red" ~: amigosDe redConUnSoloUsuario2 usuario2_1 ~?= [],

    " amigosDe usuario en red sin relaciones con ese usuario" ~: amigosDe red2 usuario2_6 ~?= [],

    " amigosDe usuario con un solo amigo en una red con relaciones" ~: amigosDe red2 usuario2_3 ~?= [usuario2_1],

    " amigosDe usuario con multiples amigos en una red con relaciones" ~: amigosDe red2 usuario2_1 ~?= [usuario2_3, usuario2_5]

main = runTestTT test2