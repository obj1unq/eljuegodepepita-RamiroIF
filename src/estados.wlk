import wollok.game.*

object descansada {
    method image() = "pepita.png"

    method mover(direccion, pepita) {
        pepita.volar(direccion)
        if (pepita.estaCansada()) {
            pepita.cambiarEstado(cansada)
            game.stop()
        }
    }

}

object cansada {
    method image() = "pepita-gris.png"

    method mover(direccion, pepita) {}
    
}

object muerta {
    method image() = "pepita-gris.png"

    method mover(direccion, pepita) {}
}