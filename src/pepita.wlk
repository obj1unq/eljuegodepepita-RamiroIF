import wollok.game.*
import direcciones.*
import extras.*
import comidas.*
import estados.*
import muros.*

object pepita {
	var property position = game.at(5, 3)
	var energia = 100
	var estado = descansada

	method text() = "/n/n/n/n" + energia

	method image() = estado.image()

	method positionX() = position.x()

	method energia() = energia

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
		const gastoEnergeticoPorKM = 9
		const siguientePosicion = direccion.siguiente(position)

		if (self.puedeVolarA(siguientePosicion)) {
			energia = energia - gastoEnergeticoPorKM 	// Consumo de energia
			position = siguientePosicion 				// Cambio de posicion
		}
	}

	method puedeVolarA(siguientePosicion) = position != siguientePosicion && not self.hayMuroEn(siguientePosicion)

	method hayMuroEn(posicion) {
		return posicion == muro.position()
		// no me gusta lo de sacarte el muro del import y preguntarle al muro si esta ahi
		// Se que tambien podria tener varios en el tablero, pero creo q seguiria haciendo cosas raras como verificar las posiciones de los muros en una lista.
	}

	method descender() { // Bonus tutorial 2
		position = abajo.siguiente(position)
	}

	method morir() {
		estado = muerta // Podria usar estado = cansada para aprovechar el image = pepitagris que ya tiene hecho
		game.say(self, "¡PERDÍ!")
	    game.schedule(2000, { => game.stop() })	
	}

	method ganar() {
		game.say(self, "¡GANE!")
		game.schedule(2000, { => game.stop() })
	}

	// Ninguno de los dos .say() funcionan, ni poniendolos aca ni poniendolos directamente en el bloque de la colision en "main".

}

