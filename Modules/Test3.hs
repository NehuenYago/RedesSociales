module Modules.Test3 where

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
usuario3_1 = (1, "Juan")
usuario3_2 = (2, "Natalia")
usuario3_3 = (3, "Pedro")
usuario3_4 = (4, "Mariela")
usuario3_5 = (5, "Natalia")
usuario3_6 = (6, "Juan")

relacion3_1_2 = (usuario3_1, usuario3_2)
relacion3_1_3 = (usuario3_1, usuario3_3)
relacion3_1_4 = (usuario3_1, usuario3_4)
relacion3_1_5 = (usuario3_1, usuario3_5)
relacion3_1_6 = (usuario3_1, usuario3_6)
relacion3_2_3 = (usuario3_2, usuario3_3)
relacion3_2_4 = (usuario3_2, usuario3_4)
relacion3_2_5 = (usuario3_2, usuario3_5)
relacion3_2_6 = (usuario3_2, usuario3_6)
relacion3_3_4 = (usuario3_3, usuario3_4)
relacion3_3_5 = (usuario3_3, usuario3_5)
relacion3_3_6 = (usuario3_3, usuario3_6)
relacion3_4_5 = (usuario3_4, usuario3_5)
relacion3_4_6 = (usuario3_4, usuario3_6)
relacion3_5_6 = (usuario3_5, usuario3_6)

redConUnSoloUsuario3 = ([usuario3_4], [], [])
red3 = ([usuario3_1, usuario3_3, usuario3_5, usuario3_6], [relacion3_1_3, relacion3_1_5, relacion3_2_5], [])

test3 = test [
    " cantidadDeAmigos de unico usuario en la red" ~: cantidadDeAmigos redConUnSoloUsuario3 usuario3_4 ~?= 0,

main = runTestTT test3
