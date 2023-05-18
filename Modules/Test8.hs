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
redVacia = ([],[],[])
publicaciontest8_1 = (usuario1, "Este es mi primer post", [usuario1, usuario2])
publicaciontest8_2 = (usuario1, "Este es mi segundo post", [usuario1])
publicaciontest8_3 = (usuario2, "dolor sit amet", [usuario2])
publicaciontest8_4 = (usuario2, "Este es mi tercer post", [usuario1, usuario2])

-- Casos de test
testLesGustanLasMismasPublicaciones :: Test
testLesGustanLasMismasPublicaciones = test
    [ "Red sin publicaciones" ~:
      lesGustanLasMismasPublicaciones redVacia usuario1 usuario2 ~?= True

    , "Red con una publicación que les gusta a ambos usuarios" ~:
      lesGustanLasMismasPublicaciones ([usuario1, usuario2], [], [publicaciontest8_1]) usuario1 usuario2 ~?= True

    , "Red con una publicación que les gusta solo a uno de los usuarios" ~:
      lesGustanLasMismasPublicaciones ([usuario1, usuario2], [], [publicaciontest8_2]) usuario1 usuario2 ~?= False

    , "Red con varias publicaciones que les gustan a usuarios distintos" ~:
      lesGustanLasMismasPublicaciones ([usuario1, usuario2], [], [publicaciontest8_2, publicaciontest8_3]) usuario1 usuario2 ~?= False

    , "Red con varias publicaciones que les gustan a los mismos usuarios" ~:
      lesGustanLasMismasPublicaciones ([usuario1, usuario2], [], [publicaciontest8_1, publicaciontest8_4]) usuario1 usuario2 ~?= True
    ]


runTests = runTestTT testLesGustanLasMismasPublicaciones