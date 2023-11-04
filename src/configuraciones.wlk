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
		personajeDos.crear()
	}

	method configurarTeclado() {
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
	}

}

