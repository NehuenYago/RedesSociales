module Modules.Test4 where

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

-- usuarios
usuario4_1 = (1, "Juan")
usuario4_2 = (2, "Natalia")
usuario4_3 = (3, "Pedro")
usuario4_4 = (4, "Mariela")
usuario4_5 = (5, "Natalia")

-- relaciones
relacion4_1_2 = (usuario4_1,usuario4_2)
relacion4_1_3 = (usuario4_1,usuario4_3)
relacion4_2_3 = (usuario4_2,usuario4_3)
relacion4_4_5 = (usuario4_4,usuario4_5)

-- redes con distintas caracteristicas
redConUnicoUsuario = ([usuario4_1],[],[])
redVariosUsuariosSinRelacion = ([usuario4_1,usuario4_2,usuario4_3],[],[])
redVariosUsuariosConUnicaRelacion = ([usuario4_1,usuario4_2,usuario4_3],[relacion4_1_2],[])
-- red con varios usuarios donde hay uno con la mayor cantidad de amigos
redVariosUsuarios1 = ([usuario4_1,usuario4_2,usuario4_3],[relacion4_1_2,relacion4_1_3],[])
-- red con varios usuarios donde hay mas de uno con la mayor cantidad de amigos
redVariosUsuarios2 = ([usuario4_1,usuario4_2,usuario4_3,usuario4_4,usuario4_5],[relacion4_1_2,relacion4_1_3,relacion4_2_3,relacion4_4_5],[])

respuesta4_1 = [usuario4_1,usuario4_2,usuario4_3]
respuesta4_2 = [usuario4_1,usuario4_2]
respuesta4_3 = [usuario4_1,usuario4_2,usuario4_3]

-- Casos de test
test4 = test [
    "usuarioConMasAmigos unico usuario sin relacion" ~: usuarioConMasAmigos redConUnicoUsuario ~?= usuario4_1,

    "usuarioConMasAmigos varios usuarios pero sin relacion" ~: expectAny (usuarioConMasAmigos redVariosUsuariosSinRelacion) respuesta4_1,
    
    "usuarioConMasAmigos varios usuarios pero unica relacion" ~: expectAny (usuarioConMasAmigos redVariosUsuariosConUnicaRelacion) respuesta4_2,

    "usuarioConMasAmigos varios usuarios con unico mayor cantidad de amigos" ~: usuarioConMasAmigos redVariosUsuarios1 ~?= usuario4_1,

    "usuarioConMasAmigos varios usuarios donde varios tienen la mayor cantidad de amigos" ~: expectAny (usuarioConMasAmigos redVariosUsuarios2) respuesta4_3
 ]

expectAny actual expected = elem actual expected ~? ("expected any of: " ++ show expected ++ "\n but got: " ++ show actual)

main = runTestTT test4