module Modules.PublicacionesQueLeGustanA where
import Modules.FuncionesBase
import Modules.FuncionesAuxiliares

-- le envia a tomaPublicacion la lista de publicaciones de la red
publicacionesQueLeGustanA :: RedSocial -> Usuario -> [Publicacion]
publicacionesQueLeGustanA red usuario = tomaPublicacion (publicaciones red) usuario 0

-- envia a buscaLikes uno a uno todos los elementos de listaPublicaciones, que es la lista de las publicaciones de la red
tomaPublicacion :: [Publicacion] -> Usuario -> Int -> [Publicacion]
tomaPublicacion listaPublicaciones usuario n
 | n >= longitud listaPublicaciones = []
 | otherwise = buscaLikes listaPublicaciones n (listaPublicaciones !! n) usuario

-- recibe una publicacion y compara al usuario de quien quiero saber los "me gusta" con los likes de dicha publicacion
-- si encuentra que le dio like, lo concatena con el resultado de verificar los likes en la siguiente publicacion
-- si no encuentra que el usuario buscado le dio like, pasa a la siguiente publicacion ()
buscaLikes :: [Publicacion] -> Int -> Publicacion -> Usuario -> [Publicacion]
buscaLikes listaPublicaciones n (_, _, []) usuario = tomaPublicacion listaPublicaciones usuario (n+1)
buscaLikes listaPublicaciones n (u, post, l:ls) usuario
 | l == usuario = (listaPublicaciones !! n) : tomaPublicacion listaPublicaciones usuario (n+1)
 | otherwise = buscaLikes listaPublicaciones n (u, post, ls) usuario
