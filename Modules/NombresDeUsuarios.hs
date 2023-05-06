module Modules.NombresDeUsuarios where
import Modules.FuncionesBase

nombresDeUsuarios :: RedSocial -> [String]
nombresDeUsuarios red = extraeNombresDeUsuario (usuarios red)

extraeNombresDeUsuario :: [Usuario] -> [String]
extraeNombresDeUsuario [] = []
extraeNombresDeUsuario (x:xs) = nombreDeUsuario x : extraeNombresDeUsuario xs
