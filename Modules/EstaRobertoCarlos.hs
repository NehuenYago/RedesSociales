module Modules.EstaRobertoCarlos where

import Modules.CantidadDeAmigos
import Modules.FuncionesBase

estaRobertoCarlos :: RedSocial -> Bool
estaRobertoCarlos red = aux (usuarios red)
  where
    aux [] = False
    aux (u:us) = masDeUnMillonDeAmigos red u || aux us

masDeUnMillonDeAmigos :: RedSocial -> Usuario -> Bool
masDeUnMillonDeAmigos red u = cantidadDeAmigos red u > 10
