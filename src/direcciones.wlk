import wollok.game.*
import pepita.*

object arriba {
    method siguiente(posicion) = if (posicion.y() < (game.height()-1)) 
                                        posicion.up(1) 
                                else posicion
}

object abajo {
    method siguiente(posicion) = if (posicion.y() > 0) 
                                        posicion.down(1) 
                                else posicion
}

object izquierda {
    method siguiente(posicion) = if (posicion.x() > 0) 
                                        posicion.left(1) 
                                else posicion

    // method siguiente(posicion) {
    //     if (posicion.x() > 0) {
    //         posicion.left(1)
    //     } else {
    //         posicion
    //     }
    // }

    // Por que no funciona con Return? Si estoy dandole una expresion/valor por parametro
    // y estoy devolviendo una expresion, pero si pongo Return da error.
    // Aun que en el codigo de pepita es un metodo de orden, en ESTE codigo eso no lo sabe
    // Por lo tanto, deberia de ser un metodo de consulta, no?????
}

object derecha {
    method siguiente(posicion) = if (posicion.x() < game.width()-1) 
                                        posicion.right(1) 
                                else posicion
}
