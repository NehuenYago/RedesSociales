module Modules.EstaRobertoCarlos where
import Modules.FuncionesBase
import Modules.CantidadDeAmigos


estaRobertoCarlos :: RedSocial -> Bool
estaRobertoCarlos red = any (masDeUnMillonDeAmigos red) (filtrarPorNombre "Roberto Carlos" (usuarios red))

masDeUnMillonDeAmigos :: RedSocial -> Usuario -> Bool
masDeUnMillonDeAmigos red u = cantidadDeAmigos red u > 1000000

filtrarPorNombre :: String -> [Usuario] -> [Usuario]
filtrarPorNombre nombre = filter (\(_, n) -> n == nombre)
