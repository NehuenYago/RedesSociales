module Modules.CantidadDeAmigos where
import Modules.FuncionesBase
import Modules.AmigosDe

cantidadDeAmigos :: RedSocial -> Usuario -> Int
cantidadDeAmigos red u = length (amigosDe red u)
