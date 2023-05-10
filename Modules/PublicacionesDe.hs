module Modules.PublicacionesDe where
import Modules.FuncionesBase
import Modules.FuncionesAuxiliares

publicacionesDe :: RedSocial -> Usuario -> [Publicacion]
publicacionesDe red u = eliminarRepetidos (publicacionesDeAux (publicaciones red) u 0)

publicacionesDeAux :: [Publicacion] -> Usuario -> Int -> [Publicacion]
publicacionesDeAux listaPublicaciones u n
 | n >= length listaPublicaciones = []
 | otherwise = tomaPublicacion (listaPublicaciones !! n) listaPublicaciones u n

tomaPublicacion :: Publicacion -> [Publicacion] -> Usuario -> Int -> [Publicacion]
tomaPublicacion (usuario,post,likes) listaPublicaciones u n
 | usuario == u = (usuario,post,likes) : publicacionesDeAux listaPublicaciones u (n+1)
 | otherwise = publicacionesDeAux listaPublicaciones u (n+1)
