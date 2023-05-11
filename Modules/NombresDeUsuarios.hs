module Modules.NombresDeUsuarios where
import Modules.FuncionesBase

-- devuelve una lista con los nombres de usuario de los usuarios de una red
nombresDeUsuarios :: RedSocial -> [String]
nombresDeUsuarios red = extraeNombresDeUsuario (usuarios red)

extraeNombresDeUsuario :: [Usuario] -> [String]
extraeNombresDeUsuario [] = []
extraeNombresDeUsuario (x:xs) = nombreDeUsuario x : extraeNombresDeUsuario xs
