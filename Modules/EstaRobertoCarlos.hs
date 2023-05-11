module Modules.EstaRobertoCarlos where

import Modules.CantidadDeAmigos
import Modules.FuncionesBase

estaRobertoCarlos :: RedSocial -> Bool
estaRobertoCarlos red = any (masDeUnMillonDeAmigos red) (usuarios red)

masDeUnMillonDeAmigos :: RedSocial -> Usuario -> Bool
masDeUnMillonDeAmigos red u = cantidadDeAmigos red u > 1000000
