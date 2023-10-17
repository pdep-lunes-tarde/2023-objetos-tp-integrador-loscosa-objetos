import wollok.game.*
import plataforma.*

object config {
	
	method configurarTablero() {
		
		const plataformaUno = new Plataforma()
		
		game.width(20)
		game.height(12)
		game.cellSize(50)
		game.title("UTN Fight")
		game.boardGround("imageBackgroundMap.jpg")
		plataformaUno.inicializar()
		game.onCollideDo(plataformaUno, {elemento => game.say(plataformaUno, "¡Cuidado!")})
	}
	
	
	method configurarTeclado() {
		
		
	}
}
