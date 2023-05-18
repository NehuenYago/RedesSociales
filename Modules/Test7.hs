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
redVacia = ([],[],[])
publicaciontest7_1 = (usuario1, "Este es mi segundo post", [usuario1])
publicaciontest7_2 = (usuario2, "Lorem Ipsum", [])
publicaciontest7_3 = (usuario3, "dolor sit amet", [usuario1])
publicaciontest7_4 = (usuario4, "I am Alice. Not", [usuario1])

-- Casos de test
testPublicacionesQueLeGustanA :: Test
testPublicacionesQueLeGustanA = test
    [ "Red sin publicaciones" ~:
      publicacionesQueLeGustanA redVacia usuario1 ~?= []

    , "Red con publicaciones pero ninguna le gusta al usuario" ~:
      publicacionesQueLeGustanA ([usuario1], [], [publicacion1_4]) usuario1 ~?= []

    , "Red con una publicación que le gusta al usuario" ~:
      publicacionesQueLeGustanA ([usuario1], [], [publicaciontest7_1]) usuario1 ~?= [publicaciontest7_1]

    , "Red con múltiples publicaciones que le gustan al usuario" ~:
      publicacionesQueLeGustanA ([usuario1], [], [publicaciontest7_1,
                                                       publicaciontest7_2,
                                                       publicaciontest7_3,
                                                       publicaciontest7_4]) usuario1 ~?=
         [publicaciontest7_1, publicaciontest7_3, publicaciontest7_4]
    ]

runTests = runTestTT testPublicacionesQueLeGustanA