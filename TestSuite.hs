import Test.HUnit
import RedSocial

usuario1 = (1, "Juan")
usuario2 = (2, "Natalia")
usuario3 = (3, "Tagliafico")
usuario4 = (4, "Mariela")
usuario5= (5, "Natalia")
usuario6 = (6, "Tomas")
usuario7 = (7, "De Paul")
usuario8 = (8, "Lucas")
usuario9 = (9, "Julian")
usuario10 = (10, "Lionel")
usuario11 = (11, "Fideo")
usuario12 = (12, "Julio")
usuario13 = (13, "Juan")
usuario14 = (14, "Natalia")

relacion1_2 = (usuario1, usuario2)
relacion1_3 = (usuario1, usuario3)
relacion1_4 = (usuario1, usuario4)
relacion1_5 = (usuario1, usuario5)
relacion1_6 = (usuario1, usuario6)
relacion1_7 = (usuario1, usuario7)
relacion1_8 = (usuario1, usuario8)
relacion1_9 = (usuario1, usuario9)
relacion1_10 = (usuario1, usuario10)
relacion1_11 = (usuario1, usuario11)
relacion1_12 = (usuario1, usuario12)
relacion2_3 = (usuario2, usuario3)
relacion2_5 = (usuario2, usuario5)
relacion2_6 = (usuario2, usuario6)
relacion2_7 = (usuario2, usuario7)
relacion2_8 = (usuario2, usuario8)
relacion2_9 = (usuario2, usuario9)
relacion2_10 = (usuario2, usuario10)
relacion2_11 = (usuario5, usuario11)
relacion2_12 = (usuario2, usuario12)
relacion4_5 = (usuario4, usuario5)

publicacion1 = (usuario1,"No hay que ir para atras ni para darse impulso - L. Tse",[usuario2,usuario3])
publicacion2 = (usuario2,"No hay caminos para la paz; la paz es el camino - M. Ghandi",[usuario1])
publicacion3 = (usuario6,"Estoy haciendo un test",[usuario6, usuario1])
publicacion4 = (usuario2,"Haz el amor y no la guerra - J. Lennon",[usuario9])
publicacion5 = (usuario5,"Lo peor que hacen los malos es obligarnos a dudar de los buenos - J. Benavente",[usuario10])
publicacion6 = (usuario6,"Que bien que deje fisica",[usuario6])
publicacion7 = (usuario7,"I am become Death, the destroyer of worlds - J. Oppenheimer",[])
publicacion8 = (usuario7,"Eureka! - Arquimedes",[])
publicacion9 = (usuario9,"Que mira bobo? - L. Messi",[])
publicacion10 = (usuario7,"No te debes engañar a ti mismo y eres la persona mas facil de engañar - R. Feynman",[usuario1,usuario5])
publicacion11 = (usuario7,"A veces son las personas de las que nadie espera nada las que hacen las cosas que nadie imagina - A. Turing",[usuario1])
publicacion12 = (usuario7,"Aquellos que no representan nada, caen por todo - A. Hamilton",[usuario2])
publicacion13 = (usuario7,"They're taking the hobbits to Isengard! - Legolas",[usuario1, usuario5])
publicacion14 = (usuario6,"Mira que te como - E. Martinez",[usuario6, usuario5])

usuarios1 = [usuario1, usuario2, usuario3]
usuarios2 = [usuario1]
usuarios3 = [usuario1, usuario2, usuario3, usuario4, usuario13, usuario14] 
usuarios4 = [usuario1, usuario3, usuario5, usuario6]
usuarios5 = [usuario1,usuario2,usuario3,usuario4,usuario5]
usuarios6 = [usuario1, usuario2, usuario3, usuario4, usuario5, usuario6, usuario7, 
 usuario8, usuario9, usuario10, usuario11, usuario12, usuario13, usuario14]

relaciones1 = [relacion1_3, relacion1_5, relacion1_12, relacion2_5]
relaciones2 = [relacion1_2]
relaciones3 = [relacion1_2,relacion1_3,relacion2_3,relacion4_5]
relaciones4 = [relacion1_2, relacion1_3, relacion1_4, relacion1_5, relacion1_6, relacion1_7, 
 relacion1_8, relacion1_9, relacion1_10, relacion1_11, relacion1_12]
relaciones5 = [relacion1_2, relacion1_3, relacion1_4, relacion1_5, relacion2_6, relacion2_7, 
 relacion2_8, relacion2_9, relacion2_10, relacion2_11, relacion2_12]
relaciones6 = [relacion1_2, relacion1_3, relacion1_4, relacion1_5, relacion1_6, relacion1_7, 
 relacion1_8, relacion1_9, relacion1_10]
relaciones7 = [relacion1_2, relacion1_3, relacion4_5]

publicaciones1 = []
publicaciones2 = [publicacion2, publicacion5, publicacion9, publicacion7, publicacion10]
publicaciones3 = [publicacion1]
publicaciones4 = [publicacion13, publicacion10, publicacion1]
publicaciones5 = [publicacion8]
publicaciones6 = [publicacion8, publicacion7]
publicaciones7 = [publicacion6]
publicaciones8 = [publicacion3]

redVacia = ([], [], [])
red1 = (usuarios1, [], [])
redSoloConUnUsuario = (usuarios2, [], [])
redSoloConUsuariosRepetidos = (usuarios3, [], [])
redConUsuariosConAmigos = (usuarios4, relaciones1, [])
redVariosUsuariosConUnicaRelacion = (usuarios1, relaciones2,[])
redVariosUsuarios = (usuarios5, relaciones3,[])
redVariosUsuarios2 = (usuarios5, relaciones7,[])
redRobertoCarlos = (usuarios6, relaciones4, [])
redSinRelaciones = (usuarios6,[],[])
redPocosAmigos = (usuarios6, relaciones3, [])
redDiezAmigos = (usuarios6, relaciones6, [])
redOnceRelaciones = (usuarios6, relaciones5, [])
redSinPublicaciones = (usuarios6, relaciones1, publicaciones1)
redConPublicaciones = (usuarios6, relaciones1, publicaciones2)
redConPublicaciones2 = (usuarios6, relaciones1, publicaciones4)
redConPublicaciones3 = (usuarios6, relaciones1, publicaciones6)
redConUnaPublicacion = (usuarios6, relaciones1, publicaciones3)
redConUnaPublicacion2 = (usuarios6, relaciones1, publicaciones5)
redConUnaPublicacionAutolike = (usuarios6, relaciones1, publicaciones7)
redConUnaPublicacionAutolike2 = (usuarios6, relaciones1, publicaciones8)

main = runTestTT todosLosTests

todosLosTests = test [testNombresDeUsuarios, testAmigosDe, testCantidadDeAmigos, testUsuarioConMasAmigos, testEstaRobertoCarlos,
    testPublicacionesDe, testPublicacionesQueLesGustanA, testLesGustanLasMismasPubicaciones, testTieneUnSeguidorFiel, testExisteSecuenciaDeAmigos]

testNombresDeUsuarios :: Test
testNombresDeUsuarios = test [
    " nombresDeUsuario red vacia" ~: nombresDeUsuarios redVacia ~?= [],

    " nombresDeUsuario red con un solo usuario" ~: nombresDeUsuarios redSoloConUnUsuario ~?= ["Juan"],

    " nombresDeUsuario red con varios usuarios de nombres distintos" ~: nombresDeUsuarios red1 ~?= ["Juan", "Natalia", "Tagliafico"],

    " nombresDeUsuario red con varios usuarios algunos con nombres iguales" ~: nombresDeUsuarios redSoloConUsuariosRepetidos ~?= ["Juan", "Natalia", "Tagliafico", "Mariela"]
 ]

testAmigosDe :: Test
testAmigosDe = test [
    " amigosDe unico usuario de una red" ~: amigosDe redSoloConUnUsuario usuario1 ~?= [],

    " amigosDe usuario en red sin relaciones con ese usuario" ~: amigosDe redConUsuariosConAmigos usuario6 ~?= [],

    " amigosDe usuario con un solo amigo en una red con relaciones" ~: amigosDe redConUsuariosConAmigos usuario3 ~?= [usuario1],

    " amigosDe usuario con multiples amigos en una red con relaciones" ~: amigosDe redConUsuariosConAmigos usuario1 ~?= [usuario3, usuario5, usuario12]
 ]

testCantidadDeAmigos :: Test
testCantidadDeAmigos = test [
    " cantidadDeAmigos de unico usuario en la red" ~: cantidadDeAmigos redSoloConUnUsuario usuario1 ~?= 0,
    
    " cantidadDeamigos de usuario sin amigos" ~: cantidadDeAmigos redConUsuariosConAmigos usuario6 ~?= 0,

    " cantidadDeAmigos de usuario con un solo amigo" ~: cantidadDeAmigos redConUsuariosConAmigos usuario3 ~?= 1,

    " cantidadDeAmigos de usuario con multiples amigos" ~: cantidadDeAmigos redConUsuariosConAmigos usuario1 ~?= 3
 ]

testUsuarioConMasAmigos :: Test
testUsuarioConMasAmigos = test [
    " usuarioConMasAmigos unico usuario sin relacion" ~: usuarioConMasAmigos redSoloConUnUsuario ~?= usuario1,

    " usuarioConMasAmigos varios usuarios pero sin relacion" ~: expectAny (usuarioConMasAmigos red1) [usuario1,usuario2,usuario3],
    
    " usuarioConMasAmigos varios usuarios pero unica relacion" ~: expectAny (usuarioConMasAmigos redVariosUsuariosConUnicaRelacion) [usuario1,usuario2],

    " usuarioConMasAmigos varios usuarios con unico mayor cantidad de amigos" ~: usuarioConMasAmigos redConUsuariosConAmigos ~?= usuario1,

    " usuarioConMasAmigos varios usuarios donde varios tienen la mayor cantidad de amigos" ~: expectAny (usuarioConMasAmigos redVariosUsuarios) [usuario1,usuario2,usuario3]
 ]

testEstaRobertoCarlos :: Test
testEstaRobertoCarlos = test [
    " estaRobertoCarlos red sin usuarios" ~: estaRobertoCarlos redVacia ~?= False,

    " estaRobertoCarlos red con 12 usuarios sin relaciones" ~: estaRobertoCarlos redSinRelaciones ~?= False,

    " estaRobertoCarlos red con 12 usuarios pero <10 amigos" ~: estaRobertoCarlos redPocosAmigos ~?= False,

    " estaRobertoCarlos red con 12 usuarios y 10 amigos" ~: estaRobertoCarlos redDiezAmigos ~?= False,

    " estaRobertoCarlos red con 12 usuarios y 11 relaciones" ~: estaRobertoCarlos redOnceRelaciones ~?= False,

    " estaRobertoCarlos red con 12 usuarios y 11 amigos" ~: estaRobertoCarlos redRobertoCarlos ~?= True
 ]

testPublicacionesDe :: Test
testPublicacionesDe = test [
    " publicacionesDe red sin publicaciones" ~: publicacionesDe redSinPublicaciones usuario1 ~?= [],

    " publicacionesDe red sin publicaciones para el usuario dado" ~: publicacionesDe redConPublicaciones usuario14 ~?= [],
    
    " publicacionesDe red con una publicacion para el usuario dado" ~: publicacionesDe redConPublicaciones usuario2 ~?= [publicacion2],
    
    " publicacionesDe red con multiples publicaciones para el usuario dado" ~: expectAny (publicacionesDe redConPublicaciones usuario7) [[publicacion7, publicacion10], [publicacion10,publicacion7]]
 ]

testPublicacionesQueLesGustanA :: Test
testPublicacionesQueLesGustanA = test [ 
    " publicacionesQueLesGustanA red sin publicaciones" ~: publicacionesQueLeGustanA redSinPublicaciones usuario1 ~?= [],
    
    " publicacionesQueLesGustanA red con una publicacion sin like del usuario dado" ~: publicacionesQueLeGustanA redConUnaPublicacion usuario8 ~?= [],
    
    " publicacionesQueLesGustanA red con una publicacion con un like del usuario dado" ~: publicacionesQueLeGustanA redConUnaPublicacion usuario2 ~?= [publicacion1],
    
    " publicacionesQueLesGustanA red con publicaciones sin like del usuario dado" ~: publicacionesQueLeGustanA redConPublicaciones usuario14 ~?= [],
    
    " publicacionesQueLesGustanA red con publicaciones con un solo like del usuario dado" ~: publicacionesQueLeGustanA redConPublicaciones usuario10 ~?= [publicacion5],
    
    " publicacionesQueLesGustanA red con publicaciones con likes del usuario dado" ~: expectAny (publicacionesQueLeGustanA redConPublicaciones usuario1) [[publicacion2, publicacion10], [publicacion10,publicacion2]]
 ]

testLesGustanLasMismasPubicaciones :: Test
testLesGustanLasMismasPubicaciones = test [ 
    " lesGustanLasMismasPublicaciones red sin publicaciones" ~: lesGustanLasMismasPublicaciones redSinPublicaciones usuario1 usuario5 ~?= True,
    
    " lesGustanLasMismasPublicaciones red con una publicacion que le gusta a ambos usuarios" ~: lesGustanLasMismasPublicaciones redConUnaPublicacion usuario2 usuario3 ~?= True,

    " lesGustanLasMismasPublicaciones red con una publicacion que no le gusta a los dos" ~: lesGustanLasMismasPublicaciones redConPublicaciones usuario2 usuario5 ~?= False,

    " lesGustanLasMismasPublicaciones red con publicaciones, los usuarios le dieron like a publicaciones distintas" ~: lesGustanLasMismasPublicaciones redConPublicaciones usuario1 usuario10 ~?= False,
    
    " lesGustanLasMismasPublicaciones red con publicaciones, los usuarios le dieron like a las mismas publicaciones" ~: lesGustanLasMismasPublicaciones redConPublicaciones2 usuario1 usuario5 ~?= True
 ]

testTieneUnSeguidorFiel :: Test
testTieneUnSeguidorFiel = test [
    " tieneUnSeguidorFiel red sin publicaciones" ~: tieneUnSeguidorFiel redSinPublicaciones usuario1 ~?= False,

    " tieneUnSeguidorFiel red con publicaciones, ninguna del usuario dado" ~: tieneUnSeguidorFiel redConPublicaciones usuario14 ~?= False,
    
    " tieneUnSeguidorFiel red con una publicacion del usuario dado sin likes" ~: tieneUnSeguidorFiel redConUnaPublicacion2 usuario7 ~?= False,
    
    " tieneUnSeguidorFiel red con una publicacion del usuario dado con al menos un like" ~: tieneUnSeguidorFiel redConUnaPublicacion usuario1 ~?= True,

    " tieneUnSeguidorFiel red con publicaciones del usuario dado sin likes" ~: tieneUnSeguidorFiel redConPublicaciones3 usuario7 ~?= False,
    
    " tieneUnSeguidorFiel red con publicaciones del usuario dado no todas tienen like por el mismo usuario" ~: tieneUnSeguidorFiel redConPublicaciones usuario7 ~?= False,
    
    " tieneUnSeguidorFiel red con publicaciones del usuario dado todas tienen un like del mismo usuario" ~: tieneUnSeguidorFiel redConPublicaciones2 usuario7 ~?= True,

    " tieneUnSeguidorFiel red con una publicacion del usuario dado cuyo unico like es propio" ~: tieneUnSeguidorFiel redConUnaPublicacionAutolike usuario6 ~?= False,

    " tieneUnSeguidorFiel red con una publicacion del usuario con un like propio y otros likes" ~: tieneUnSeguidorFiel redConUnaPublicacionAutolike2 usuario6 ~?= True

 ]

testExisteSecuenciaDeAmigos :: Test
testExisteSecuenciaDeAmigos = test [
    " existeSecuenciaDeAmigos red sin relaciones" ~: existeSecuenciaDeAmigos redSinRelaciones usuario1 usuario12 ~?= False,

    " existeSecuenciaDeAmigos red con una relacion, sin los usuarios dados" ~: existeSecuenciaDeAmigos redVariosUsuariosConUnicaRelacion usuario1 usuario14 ~?= False,

    " existeSecuenciaDeAmigos red con una relacion directa entre los usuarios dados" ~: existeSecuenciaDeAmigos redVariosUsuariosConUnicaRelacion usuario1 usuario2 ~?= True,
    
    " existeSecuenciaDeAmigos red con multiples relaciones, uno de los usuarios dados no tiene relaciones" ~: existeSecuenciaDeAmigos redVariosUsuarios usuario1 usuario12 ~?= False,
    
    " existeSecuenciaDeAmigos red con multiples relaciones, sin relacion directa o indirecta entre los usuarios dados" ~: existeSecuenciaDeAmigos redVariosUsuarios2 usuario1 usuario4 ~?= False,
    
    " existeSecuenciaDeAmigos red con multiples relacioens, con una relaciones directa entre los usuarios dados" ~: existeSecuenciaDeAmigos redVariosUsuarios2 usuario1 usuario2 ~?= True,
    
    " existeSecuenciaDeAmigos red con multiples relaciones, con una relacion indirecta entre los usuarios dados" ~: existeSecuenciaDeAmigos redVariosUsuarios2 usuario1 usuario3 ~?= True
 ]

expectAny actual expected = elem actual expected ~? (" expected any of: " ++ show expected ++ "\n but got: " ++ show actual)
