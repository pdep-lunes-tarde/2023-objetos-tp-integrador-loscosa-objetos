import wollok.game.*
import plataforma.*
import visuales.*
import configuraciones.*
import main.*

object tpIntegrador {
	//method jugar() {
		//tablero.iniciarTablero()
		//imagenInicio.mostrar()
		//const personaje = new Personaje()
		//game.onTick(30,"gravity",{personaje.actualizar()})
		//game.onTick(160,"animations",{personaje.animaciones()})
		//personaje.inicializar()
		//const plataformaUno = new Plataforma()
		//game.width(20)
		//game.height(12)
		//game.cellSize(50)
		//game.title("UTN Fight")
		//game.boardGround("imageBackgroundMap.jpg")
		//plataformaUno.inicializar()
		//game.onCollideDo(plataformaUno, {elemento => personaje.choqueConPlataforma()})		
		//game.start()
	//}
	
	method iniciar() {
		
		config.configurarTablero()
		
		imagenInicio.mostrar()
		
		keyboard.enter().onPressDo{self.iniciarPelea()}
		
		
		
		
		game.start()
		
	}
	
	method iniciarPelea(){
		game.clear()
		plataformaCentral.crear()
		bordes.crear()
		config.agregarPersonajes()
		config.configurarTeclado()
		game.onTick(30,"gravity",{robertoMecanico.actualizar()})
		game.onTick(30, "apareceMoneda",{bordes.aparecerMoneda()})
		game.schedule(500,{
			game.removeTickEvent("apareceMoneda")
			game.removeVisual(robertoMecanico)
		})
		//game.onTick(160,"animations",{personaje.animaciones()})
	}
}

