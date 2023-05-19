module Modules.PublicacionesDe where
import Modules.FuncionesBase
import Modules.FuncionesAuxiliares
import Modules.Ejemplos
-- le pasa como parametro a enviaPublicacion la lista de publicaciones de red, el usuario
-- de quien se quieren las publicaciones y el valor 0 en la variable que se usara para
-- enviar los elementos de listaPublicaciones a comparaUsuario
publicacionesDe :: RedSocial -> Usuario -> [Publicacion]
publicacionesDe red u = eliminarRepetidos (enviaPublicacion (publicaciones red) u 0)

-- envia uno a uno los elementos de listaPublicaciones a comparaUsuario
enviaPublicacion :: [Publicacion] -> Usuario -> Int -> [Publicacion]
enviaPublicacion listaPublicaciones u n
 | n >= longitud listaPublicaciones = []
 | otherwise = comparaUsuario (devuelveElemento listaPublicaciones n) listaPublicaciones u n

-- si el usuario pedido es el mismo que el de la publicacion, lo concatena con lo
-- que devuelva enviaPublicacion del siguiente elemento
comparaUsuario :: Publicacion -> [Publicacion] -> Usuario -> Int -> [Publicacion]
comparaUsuario (usuario,post,likes) listaPublicaciones u n
 | usuario == u = (usuario,post,likes) : enviaPublicacion listaPublicaciones u (n+1)
 | otherwise = enviaPublicacion listaPublicaciones u (n+1)

publicacionesDe2 :: RedSocial -> Usuario -> [Publicacion]
publicacionesDe2 (us,rels,pubs) u = eliminarRepetidos (publicacionesDe2Aux pubs u)

publicacionesDe2Aux :: [Publicacion] -> Usuario -> [Publicacion]
publicacionesDe2Aux [] _ = []
publicacionesDe2Aux ((autor,text,likes):pubs) u 
    | u == autor = (autor,text,likes) : publicacionesDe2Aux pubs u
    | otherwise = publicacionesDe2Aux pubs u 

