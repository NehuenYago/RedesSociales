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
usuarioN_1 = (1, "Juan")

-- Casos de test
testN = test [
    "Template" ~: True ~?= True

 ]
