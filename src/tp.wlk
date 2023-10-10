import wollok.game.*
import tablero.*
import personaje.*
import plataforma.*

object tpIntegrador {
	method jugar() {
		//tablero.iniciarTablero()
		const personaje = new Personaje()
		game.onTick(30,"gravity",{personaje.actualizar()})
		personaje.inicializar()
		const plataformaUno = new Plataforma()
		game.width(20)
		game.height(12)
		game.cellSize(50)
		game.title("UTN Fight")
		game.boardGround("imageBackgroundMap.jpg")
		plataformaUno.inicializar()
		game.onCollideDo(plataformaUno, {elemento => personaje.choqueConPlataforma()})		
		game.start()
	}
}

