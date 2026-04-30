import wollok.game.*
import pepita.*

object silvestre {
    const presa = pepita
    var property position = game.at(0, 0)

    method image() = "silvestre.png"

    method position() = game.at(self.x(), 0)
    method x() {
        return presa.positionX()
    } 


    // const presa = pepita
    // var position = game.at(0, 0)   Si yo no uso property, ya que no necesito el setter
    //                                el VSCODE me dice que es una variable no usada
    //                                pero si uso el property, no le molesta que haga un GETTER
    //                                ademas del que propiamente genera el PROPERTY (osea doble getter)
    //                                PORQUE??

    // method image() = "silvestre.png"

    // method position() = game.at(self.x(), 0)
    // method x() {
    //     return presa.positionX()
    // } 
}


