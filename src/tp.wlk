import wollok.game.*
import tablero.*
import personaje.*

object tpIntegrador {
	method jugar() {
		tablero.iniciarTablero()
		const personaje = new Personaje()
		game.onTick(30,"gravity",{personaje.actualizar()})
		personaje.inicializar()		
		game.start()
	}
}

