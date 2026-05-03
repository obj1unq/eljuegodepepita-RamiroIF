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
		const gastoEnergeticoPorKM = 9

		if (!self.estaCansada() && position != siguientePosicion) {
			energia = energia - gastoEnergeticoPorKM 
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

	// method volar(kms) {
	// 	energia = energia - (9 * kms)
	// }
	
	// No me agrada que exista el metodo volar sin el if que no permita el vuelo sin tener la energia suficiente.
	// Pero si lo separo y hago

	// method volar(kms) {
	// if (!self.estaCansada())
	// 	energia = energia - (9 * kms)
	// }
	
	// Tengo que reformular mover para que no ocurra el movimiento sin energia, o tendria que repetir el !self.estaCansada()
	// Asi que elimino el methodo volar y incorporo el consumo de energia dentro del propio "Mover"
}

