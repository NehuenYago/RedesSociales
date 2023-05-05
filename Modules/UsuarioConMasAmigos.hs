module Modules.UsuarioConMasAmigos where
import Modules.FuncionesBase
import Modules.CantidadDeAmigos

usuarioConMasAmigos :: RedSocial -> Usuario
usuarioConMasAmigos (u : us, rels, pubs) = maximaCantidadDeAmigos (cantidadDeAmigosPorUsuario (u : us, rels, pubs))

-- necesito relacionar cantidad de amigos con usuarios -> lista de tupla (cantidadDeAmigos u, u)
cantidadDeAmigosPorUsuario :: RedSocial -> [(Int, Usuario)]
cantidadDeAmigosPorUsuario ([u], rels, pubs) = [(cantidadDeAmigos ([u], rels, pubs) u, u)]
cantidadDeAmigosPorUsuario (u : us, rels, pubs) = (cantidadDeAmigos (u : us, rels, pubs) u, u) : cantidadDeAmigosPorUsuario (us, rels, pubs)

-- tomando la lista de tuplas de arriba busco el elemento con maxima cantidad de amigos y retorno el Usuario correspondiente
maximaCantidadDeAmigos :: [(Int, Usuario)] -> Usuario
maximaCantidadDeAmigos [(_, u)] = u
maximaCantidadDeAmigos ((n1, u1) : (n2, u2) : xs)
    | n1 > n2 = maximaCantidadDeAmigos ((n1, u1) : xs)
    | otherwise = maximaCantidadDeAmigos ((n2, u2) : xs)
