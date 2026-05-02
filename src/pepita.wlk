import wollok.game.*
import direcciones.*
import extras.*
import comidas.*

object pepita {
	const perseguidor = silvestre
	var property position = game.at(5, 3)
	var energia = 100

	method text() = "/n/n/n/n" + energia

	method image() = "pepita" + self.estado() + ".png"

	method estado() = if (self.estaAtrapada() || self.estaCansada()) "-gris" else ""

	method positionX() = position.x()

	method energia() = energia

	method estaAtrapada() = position == perseguidor.position()

	method mover(direccion) {
		const siguientePosicion = direccion.siguiente(position)
		if (!self.estaCansada() && position != siguientePosicion) {
			self.volar(1)
			position = siguientePosicion
		}
	}

	method estaCansada() {
		const energiaNecesariaPorKM = 9
		return energia < energiaNecesariaPorKM
	}

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
		game.removeVisual(comida)
	}

	method volar(kms) {
		energia = energia - (9 * kms)
	}
	
}

