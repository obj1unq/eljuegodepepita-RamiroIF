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

	// Haciendo los tests (tardiamente) note que
	// No me agrada que exista el metodo volar sin el if que no permita el vuelo sin tener la energia suficiente.
	// Pero si lo separo y hago

	// method volar(kms) {
	// if (!self.estaCansada())
	// 	energia = energia - (9 * kms)
	// }
	
	// Tendria que reformular Mover para que no ocurra el movimiento sin energia, a priori tendria que repetir el !self.estaCansada()

	// Asi que DECIDI
	// eliminar el methodo volar y incorporar el consumo de energia dentro del propio "Mover"

	// AUNQUE si pongo en consideracion que el metodo "Volar" nunca va a ser ejecutado por el usuario final, ya que no tiene ninguna tecla asignada que lo ejecute por si solo
	// Podria existir para que me permita referenciar al consumo de energia que hace pepita al moverse de una forma mas "bonita" 
	// que si simplemente reduzco la energia en el mismo if que verifico la posicion

}

