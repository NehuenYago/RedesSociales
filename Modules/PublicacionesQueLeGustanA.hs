module Modules.PublicacionesQueLeGustanA where
import Modules.FuncionesBase

publicacionesQueLeGustanA :: RedSocial -> Usuario -> [Publicacion]
publicacionesQueLeGustanA red usuario = tomaPublicacion (publicaciones red) usuario 0

tomaPublicacion :: [Publicacion] -> Usuario -> Int -> [Publicacion]
tomaPublicacion listaPublicaciones usuario n
 | n >= length listaPublicaciones = []
 | otherwise = buscaLikes listaPublicaciones n (listaPublicaciones !! n) usuario

buscaLikes :: [Publicacion] -> Int -> Publicacion -> Usuario -> [Publicacion]
buscaLikes listaPublicaciones n (u, post, []) usuario = tomaPublicacion listaPublicaciones usuario (n+1)
buscaLikes listaPublicaciones n (u, post, l:ls) usuario
 | l == usuario = (listaPublicaciones !! n) : tomaPublicacion listaPublicaciones usuario (n+1)
 | otherwise = buscaLikes listaPublicaciones n (u, post, ls) usuario
