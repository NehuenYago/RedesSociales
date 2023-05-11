module Modules.LesGustanLasMismasPublicaciones where
import Modules.FuncionesBase
import Modules.PublicacionesQueLeGustanA
import Modules.FuncionesAuxiliares

-- dada una red social y dos usuarios de la misma quiero saber si les gustan las mismas publicaciones
-- puedo usar la funcion publicacionesQueLeGustanA que dado un usuario me devuelve la lista de publicaciones a la cual le dio like
-- pasandole a esta funcion los usuarios deseados obengo dos listas de publicaciones, las cuales puedo ver si tienen los mismos elementos

lesGustanLasMismasPublicaciones :: RedSocial -> Usuario -> Usuario -> Bool
lesGustanLasMismasPublicaciones red u1 u2 = mismosElementos (publicacionesQueLeGustanA red u1) (publicacionesQueLeGustanA red u2)
