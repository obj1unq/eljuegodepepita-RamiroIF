import wollok.game.*
import direcciones.*

object pepita {
	var property position = game.at(0, 3)
	var energia = 100

	method text() = "/n/n/n/n" + energia

	method image() = "pepita.png"

	method mover(direccion) {
		const oldPosition = position
		position = direccion.siguiente(position)

		if (position != oldPosition) self.volar(1)
	}

	method positionX() {
		return position.x()
	}

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method volar(kms) {
		energia = energia - 10 - kms 
	}
	
	method energia() {
		return energia
	}

}

