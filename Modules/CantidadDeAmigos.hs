module Modules.CantidadDeAmigos where
import Modules.FuncionesBase
import Modules.FuncionesAuxiliares
import Modules.AmigosDe

cantidadDeAmigos :: RedSocial -> Usuario -> Int
cantidadDeAmigos red u = longitud (amigosDe red u)
