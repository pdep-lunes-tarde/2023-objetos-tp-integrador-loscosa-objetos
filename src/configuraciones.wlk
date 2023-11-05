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
		game.onCollideDo(plataformaUno, { elemento => game.say(plataformaUno, "¡Cuidado!")})
	}

	method agregarPersonajes() {
		robertoMecanico.crear()
		gordoMortero.crear()
	}

	method configurarTeclado() {
		
		// ************ Configuracion teclado Roberto el Mecanico ************
		
		keyboard.w().onPressDo({ robertoMecanico.moverA(arriba)
			robertoMecanico.estaSaltando(true)
		})
		keyboard.s().onPressDo({ robertoMecanico.moverA(abajo)})
		keyboard.a().onPressDo({ robertoMecanico.moverA(izquierda)
			robertoMecanico.seMueveALaIzquierda(true)
		})
		keyboard.d().onPressDo({ robertoMecanico.moverA(derecha)
			robertoMecanico.seMueveALaDerecha(true)
		})
		keyboard.space().onPressDo({ robertoMecanico.pegar()})
		
		// ************ Configuracion teclado Roberto el Mecanico ************
		
		
		// ************ Configuracion teclado Gordo Montero ************
		
		keyboard.up().onPressDo({ gordoMortero.moverA(arriba)
			robertoMecanico.estaSaltando(true)
		})
		keyboard.down().onPressDo({ gordoMortero.moverA(abajo)})
		keyboard.left().onPressDo({ gordoMortero.moverA(izquierda)
			gordoMortero.seMueveALaIzquierda(true)
		})
		keyboard.right().onPressDo({ gordoMortero.moverA(derecha)
			gordoMortero.seMueveALaDerecha(true)
		})
		keyboard.space().onPressDo({ gordoMortero.pegar()})
		
		// ************ Configuracion teclado Gordo Montero ************
	}

}

