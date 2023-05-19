-- Template para archivos de testing
module Modules.Test9 where

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

usuario9_1 = (1, "Juan")
usuario9_2 = (2, "Natalia")
usuario9_3 = (3, "Tagliafico")
usuario9_4 = (4, "Mariela")
usuario9_5 = (5, "Natalia")
usuario9_6 = (6, "Tomas")
usuario9_7 = (7, "De Paul")
usuario9_8 = (8, "Lucas")
usuario9_9 = (9, "Julian")
usuario9_10 = (10, "Lionel")
usuario9_11 = (11, "Fideo")
usuario9_12 = (12, "Julio")

relacion9_1_2 = (usuario9_1, usuario9_2)
relacion9_1_3 = (usuario9_1, usuario9_3)
relacion9_1_4 = (usuario9_1, usuario9_4)
relacion9_1_5 = (usuario9_1, usuario9_5)
relacion9_1_6 = (usuario9_1, usuario9_6)
relacion9_1_7 = (usuario9_1, usuario9_7)
relacion9_1_8 = (usuario9_1, usuario9_8)
relacion9_1_9 = (usuario9_1, usuario9_9)
relacion9_1_10 = (usuario9_1, usuario9_10)
relacion9_1_11 = (usuario9_1, usuario9_11)
relacion9_1_12 = (usuario9_1, usuario9_12)
relacion9_2_6 = (usuario9_2, usuario9_6)
relacion9_2_7 = (usuario9_2, usuario9_7)
relacion9_2_8 = (usuario9_2, usuario9_8)
relacion9_2_9 = (usuario9_2, usuario9_9)
relacion9_2_10 = (usuario9_2, usuario9_10)
relacion9_2_11 = (usuario9_2, usuario9_11)
relacion9_2_12 = (usuario9_2, usuario9_12)

publicacion9_1 = (usuario9_1,"Hola!!!",[usuario9_2,usuario9_3])
publicacion9_2 = (usuario9_2,"MUCHAAAAAACHOSSSS",[usuario9_1])
publicacion9_2_2 = (usuario9_2,"Estoy haciendo un test",[usuario9_7])
publicacion9_2_3 = (usuario9_2,"Test",[usuario9_9])
publicacion9_5 = (usuario9_5,"test!!!",[usuario9_10])
publicacion9_6 = (usuario9_6,"Que bien que deje fisica",[usuario9_1])
publicacion9_7 = (usuario9_7,"",[])
publicacion9_8 = (usuario9_7,"Testt",[])
publicacion9_9 = (usuario9_9,"",[])
publicacion9_10 = (usuario9_7,"Testttt",[usuario9_1,usuario9_5])
publicacion9_11 = (usuario9_7,"Testtttt",[])
publicacion9_12 = (usuario9_7,"Testttttt",[usuario9_2])
publicacion9_13 = (usuario9_7,"Testtttttt",[usuario9_1])

usuarios6 = [usuario9_1, usuario9_2, usuario9_3, usuario9_4, usuario9_5, usuario9_6, usuario9_7, 
 usuario9_8, usuario9_9, usuario9_10, usuario9_11, usuario9_12]

relaciones6 = [relacion9_1_2, relacion9_1_3, relacion9_1_4, relacion9_1_5, relacion9_1_6, relacion9_1_7, 
 relacion9_1_8, relacion9_1_9, relacion9_1_10, relacion9_1_11, relacion9_1_12]

publicaciones9_1 = []
publicaciones9_2 = [publicacion9_2, publicacion9_5, publicacion9_9]
publicaciones9_3 = [publicacion9_2, publicacion9_5, publicacion9_9, publicacion9_7]
publicaciones9_4 = [publicacion9_2, publicacion9_5, publicacion9_9, publicacion9_10]
publicaciones9_5 = [publicacion9_2, publicacion9_5, publicacion9_9, publicacion9_7, publicacion9_11]
publicaciones9_6 = [publicacion9_2, publicacion9_5, publicacion9_9, publicacion9_10, publicacion9_12]
publicaciones9_7 = [publicacion9_2, publicacion9_5, publicacion9_9, publicacion9_10, publicacion9_13]

red9_1 = (usuarios6, relaciones6, publicaciones9_1)
red9_2 = (usuarios6, relaciones6, publicaciones9_2)
red9_3 = (usuarios6, relaciones6, publicaciones9_3)
red9_4 = (usuarios6, relaciones6, publicaciones9_4)
red9_5 = (usuarios6, relaciones6, publicaciones9_5)
red9_6 = (usuarios6, relaciones6, publicaciones9_6)
red9_7 = (usuarios6, relaciones6, publicaciones9_7)

test9 = test [
    "tieneUnSeguidorFiel red sin publicaciones" ~: tieneUnSeguidorFiel red9_1 usuario9_7 ~?= False,

    "tieneUnSeguidorFiel red con una publicacion sin likes publicaciones" ~: tieneUnSeguidorFiel red9_2 usuario9_7 ~?= False,
    
    "tieneUnSeguidorFiel red sin publicaciones" ~: tieneUnSeguidorFiel red9_3 usuario9_7 ~?= False,
    
    "tieneUnSeguidorFiel red sin publicaciones" ~: tieneUnSeguidorFiel red9_4 usuario9_7 ~?= True,
    
    "tieneUnSeguidorFiel red sin publicaciones" ~: tieneUnSeguidorFiel red9_5 usuario9_7 ~?= False,

    "tieneUnSeguidorFiel red sin publicaciones" ~: tieneUnSeguidorFiel red9_6 usuario9_7 ~?= False,
    
    "tieneUnSeguidorFiel red sin publicaciones" ~: tieneUnSeguidorFiel red9_7 usuario9_7 ~?= True
 ]

main = runTestTT test9
