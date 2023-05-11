module Modules.CantidadDeAmigos where
import Modules.FuncionesBase
import Modules.FuncionesAuxiliares
import Modules.AmigosDe

-- devuelve la longitud de la lista de usuarios que son amigos del usuario, por lo que entonces devuelve la cantidad de amigos del usuario
cantidadDeAmigos :: RedSocial -> Usuario -> Int
cantidadDeAmigos red u = longitud (amigosDe red u)
