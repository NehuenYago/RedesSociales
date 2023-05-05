module Modules.NombresDeUsuarios where

import Modules.FuncionesBase


-- type Usuario = (Integer, String) -- (id, nombre)
-- type Relacion = (Usuario, Usuario) -- usuarios que se relacionan
-- type Publicacion = (Usuario, String, [Usuario]) -- (usuario que publica, texto publicacion, likes)
-- type RedSocial = ([Usuario], [Relacion], [Publicacion])

-- usuarios :: RedSocial -> [Usuario]
-- usuarios (us, _, _) = us

-- nombreDeUsuario :: Usuario -> String
-- nombreDeUsuario (_, nombre) = nombre 

nombresDeUsuarios :: RedSocial -> [String]
nombresDeUsuarios red = extraeNombresDeUsuario (usuarios red)

extraeNombresDeUsuario :: [Usuario] -> [String]
extraeNombresDeUsuario [] = []
extraeNombresDeUsuario (x:xs) = nombreDeUsuario x : extraeNombresDeUsuario xs 