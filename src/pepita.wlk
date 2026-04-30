import wollok.game.*
import direcciones.*
import extras.*

object pepita {
	const perseguidor = silvestre
	var property position = game.at(0, 3)
	var energia = 100

	method text() = "/n/n/n/n" + energia

	method image() = "pepita" + self.estado() + ".png"

	method estado() = if (self.atrapada()) "-gris" else ""

	method positionX() = position.x()

	method energia() = energia

	method atrapada() = position == perseguidor.position()

	method mover(direccion) {
		const oldPosition = position
		position = direccion.siguiente(position)

		if (position != oldPosition) self.volar(1)
	}

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method volar(kms) {
		energia = energia - 10 - kms 
	}
	
}

