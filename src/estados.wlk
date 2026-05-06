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

    method mover(direccion, pepita) {
        game.stop()
    }
    // En teoria no deberia necesitar este mover, pero si ejecuto el test "Pepita no va a moverse si no tiene energia suficiente"
    // me marca el error "cansada no entiende el method Mover()"
}