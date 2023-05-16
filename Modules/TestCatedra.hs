module Modules.TestCatedra where

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
usuarioC_1 = (1, "Juan")
usuarioC_2 = (2, "Natalia")
usuarioC_3 = (3, "Pedro")
usuarioC_4 = (4, "Mariela")
usuarioC_5 = (5, "Natalia")

relacionC_1_2 = (usuarioC_1, usuarioC_2)
relacionC_1_3 = (usuarioC_1, usuarioC_3)
relacionC_1_4 = (usuarioC_4, usuarioC_1) -- Notar que el orden en el que aparecen los usuarios es indistinto
relacionC_2_3 = (usuarioC_3, usuarioC_2)
relacionC_2_4 = (usuarioC_2, usuarioC_4)
relacionC_3_4 = (usuarioC_4, usuarioC_3)

publicacionC_1_1 = (usuarioC_1, "Este es mi primer post", [usuarioC_2, usuarioC_4])
publicacionC_1_2 = (usuarioC_1, "Este es mi segundo post", [usuarioC_4])
publicacionC_1_3 = (usuarioC_1, "Este es mi tercer post", [usuarioC_2, usuarioC_5])
publicacionC_1_4 = (usuarioC_1, "Este es mi cuarto post", [])
publicacionC_1_5 = (usuarioC_1, "Este es como mi quinto post", [usuarioC_5])

publicacionC_2_1 = (usuarioC_2, "Hello World", [usuarioC_4])
publicacionC_2_2 = (usuarioC_2, "Good Bye World", [usuarioC_1, usuarioC_4])

publicacionC_3_1 = (usuarioC_3, "Lorem Ipsum", [])
publicacionC_3_2 = (usuarioC_3, "dolor sit amet", [usuarioC_2])
publicacionC_3_3 = (usuarioC_3, "consectetur adipiscing elit", [usuarioC_2, usuarioC_5])

publicacionC_4_1 = (usuarioC_4, "I am Alice. Not", [usuarioC_1, usuarioC_2])
publicacionC_4_2 = (usuarioC_4, "I am Bob", [])
publicacionC_4_3 = (usuarioC_4, "Just kidding, i am Mariela", [usuarioC_1, usuarioC_3])

usuariosC_A = [usuarioC_1, usuarioC_2, usuarioC_3, usuarioC_4]
relacionesC_A = [relacionC_1_2, relacionC_1_4, relacionC_2_3, relacionC_2_4, relacionC_3_4]
publicacionesC_A = [publicacionC_1_1, publicacionC_1_2, publicacionC_2_1, publicacionC_2_2, publicacionC_3_1, publicacionC_3_2, publicacionC_4_1, publicacionC_4_2]
redC_A = (usuariosC_A, relacionesC_A, publicacionesC_A)

usuariosC_B = [usuarioC_1, usuarioC_2, usuarioC_3, usuarioC_5]
relacionesC_B = [relacionC_1_2, relacionC_2_3]
publicacionesC_B = [publicacionC_1_3, publicacionC_1_4, publicacionC_1_5, publicacionC_3_1, publicacionC_3_2, publicacionC_3_3]
redC_B = (usuariosC_B, relacionesC_B, publicacionesC_B)

main = runTestTT tests

tests = test [
    " nombresDeUsuarios 1" ~: (nombresDeUsuarios redC_A) ~?= ["Juan","Natalia","Pedro","Mariela"],

    " amigosDe 1" ~: (amigosDe redC_A usuarioC_1) ~?= [usuario2, usuario4],

    " cantidadDeAmigos 1" ~: (cantidadDeAmigos redC_A usuarioC_1) ~?= 2,

    " usuarioConMasAmigos 1" ~: expectAny (usuarioConMasAmigos redC_A) [usuarioC_2, usuarioC_4],

    " estaRobertoCarlos 1" ~: (estaRobertoCarlos redC_A) ~?= False,

    " publicacionesDe 1" ~: (publicacionesDe redC_A usuarioC_2) ~?= [publicacionC_2_1, publicacionC_2_2],

    " publicacionesQueLeGustanA 1" ~: (publicacionesQueLeGustanA redC_A usuarioC_1) ~?= [publicacionC_2_2, publicacionC_4_1],

    " lesGustanLasMismasPublicaciones 2" ~: (lesGustanLasMismasPublicaciones redC_B usuarioC_1 usuarioC_3) ~?= True,

    " tieneUnSeguidorFiel 1" ~: (tieneUnSeguidorFiel redC_A usuarioC_1) ~?= True,

    " existeSecuenciaDeAmigos 1" ~: (existeSecuenciaDeAmigos redC_A usuarioC_1 usuarioC_3) ~?= True
 ]

expectAny actual expected = elem actual expected ~? ("expected any of: " ++ show expected ++ "\n but got: " ++ show actual)
