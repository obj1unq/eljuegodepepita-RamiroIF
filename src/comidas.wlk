import wollok.game.*

object manzana {
	var property position = game.at(6,8) 
	const base = 15 // Aumento arbitrario de energia base para mas comodidad en el game
	var madurez = 3

	method image() = "manzana.png"
	
	method energiaQueOtorga() {
		return base * madurez	
	}
	
	method madurar() {
		madurez = madurez + 1
	}

}

object alpiste {
	var property position = game.at(2,5) 

	method image() = "alpiste.png"

	method energiaQueOtorga() {
		return 20
	} 

}

