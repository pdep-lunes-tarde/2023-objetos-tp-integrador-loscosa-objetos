import wollok.game.*
import plataforma.*
import main.*
import direcciones.*

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
	
	method configurarColisiones(){
		game.onCollideDo(robertoMecanico, {objeto => objeto.colisionarConPersonaje(robertoMecanico)})
	}
	
	method agregarPersonajes() {
		robertoMecanico.crear()
	}
	
	
	method configurarTeclado() {
		
		keyboard.w().onPressDo({ robertoMecanico.moverA(arriba)})
		keyboard.s().onPressDo({ robertoMecanico.moverA(abajo)})
		keyboard.a().onPressDo({ robertoMecanico.moverA(izquierda)})
		keyboard.d().onPressDo({ robertoMecanico.moverA(derecha)})
		
	}
}
