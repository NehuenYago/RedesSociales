module Modules.Test1 where

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
usuario1_1 = (1, "Juan")
usuario1_2 = (2, "Natalia")
usuario1_3 = (3, "Pedro")
usuario1_4 = (4, "Mariela")
usuario1_5 = (5, "Natalia")
usuario1_6 = (6, "Juan")

redVacia1 = ([], [], [])
redConUnUsuario1 = ([usuario1_2], [], [])
redConVariosUsuariosDistintos1 = ([usuario1_1, usuario1_2, usuario1_3], [], [])
redConVariosUsuariosRepetidos1 = ([usuario1_1, usuario1_2, usuario1_3, usuario1_4, usuario1_5, usuario1_6], [], [])

test1 = test [
    " nombresDeUsuario red vacia" ~: nombresDeUsuarios redVacia1 ~?= [],

    " nombresDeUsuario red con un solo usuario" ~: nombresDeUsuarios redConUnUsuario1 ~?= ["Natalia"],

    " nombresDeUsuario red con varios usuarios de nombres distintos" ~: nombresDeUsuarios redConVariosUsuariosDistintos1 ~?= ["Juan", "Natalia", "Pedro"],

    " nombresDeUsuario red con varios usuarios algunos con nombres iguales" ~: nombresDeUsuarios redConVariosUsuariosRepetidos1 ~?= ["Juan", "Natalia", "Pedro", "Mariela"]
 ]

main = runTestTT test1