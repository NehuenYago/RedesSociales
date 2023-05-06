module Modules.PublicacionesDe where
import Modules.FuncionesBase

publicacionesDe :: RedSocial -> Usuario -> [String]
publicacionesDe red u = publicacionesDeAux (publicaciones red) u 0

publicacionesDeAux :: [Publicacion] -> Usuario -> Int -> [String]
publicacionesDeAux listaPublicaciones u n
 | n >= length listaPublicaciones = []
 | otherwise = tomaPublicacion (listaPublicaciones !! n) listaPublicaciones u n

tomaPublicacion :: Publicacion -> [Publicacion] -> Usuario -> Int -> [String]
tomaPublicacion (usuario,post,_) listaPublicaciones u n
 | usuario == u = post : publicacionesDeAux listaPublicaciones u (n+1)
 | otherwise = publicacionesDeAux listaPublicaciones u (n+1)
