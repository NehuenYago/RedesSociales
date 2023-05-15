module Modules.NombresDeUsuarios where
import Modules.FuncionesBase
import Modules.FuncionesAuxiliares

-- devuelve una lista con los nombres de usuario de los usuarios de una red
nombresDeUsuarios :: RedSocial -> [String]
nombresDeUsuarios red = eliminarRepetidos (extraeNombresDeUsuario (usuarios red))

extraeNombresDeUsuario :: [Usuario] -> [String]
extraeNombresDeUsuario [] = []
extraeNombresDeUsuario (x:xs) = nombreDeUsuario x : extraeNombresDeUsuario xs
