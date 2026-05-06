import wollok.game.*
import direcciones.*
import extras.*
import comidas.*
import estados.*

object pepita {
	const perseguidor = silvestre
	var property position = game.at(5, 3)
	var energia = 100
	var estado = descansada

	method text() = "/n/n/n/n" + energia

	method image() = estado.image()

	method positionX() = position.x()

	method energia() = energia

	method estaAtrapada() = position == perseguidor.position()

	method estaCansada() {
		const energiaNecesariaPorKM = 9
		return energia < energiaNecesariaPorKM
	}

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
		game.removeVisual(comida)
	}

	method cambiarEstado(nuevoEstado) {
		estado = nuevoEstado
	}

	method mover(direccion) {
		estado.mover(direccion, self)
	}

	method volar(direccion) {
		const siguientePosicion = direccion.siguiente(position)
		const gastoEnergeticoPorKM = 9

		if (position != siguientePosicion) {
			energia = energia - gastoEnergeticoPorKM 
			position = siguientePosicion
		}
	}






}

