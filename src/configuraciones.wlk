import wollok.game.*
import main.*
import direcciones.*
import visuales.*

object config {

	method configurarTablero() {
		game.width(20)
		game.height(12)
		game.cellSize(50)
		game.title("UTN Fight")
		game.boardGround("imageBackgroundMap.jpg")
	}

	method agregarPersonajes() {
		gordoMortero.crear()
		robertoMecanico.crear()
	}

	method configurarTeclado() {
		// ************ Configuracion teclado Roberto el Mecanico ************
		keyboard.w().onPressDo({ robertoMecanico.saltar()})
		keyboard.s().onPressDo({ robertoMecanico.moverA(abajo)})
		keyboard.a().onPressDo({ robertoMecanico.moverIzquierda()})
		keyboard.d().onPressDo({ robertoMecanico.moverDerecha()})
		keyboard.space().onPressDo({ robertoMecanico.pegar()})
		keyboard.c().onPressDo({ robertoMecanico.activarUlti(robertoMecanico.danioAleatorio())})
			// ************ Configuracion teclado Roberto el Mecanico ************
			// ************ Configuracion teclado Gordo Montero ************
		keyboard.up().onPressDo({ gordoMortero.saltar()})
		keyboard.down().onPressDo({ gordoMortero.moverA(abajo)})
		keyboard.left().onPressDo({ gordoMortero.moverIzquierda()})
		keyboard.right().onPressDo({ gordoMortero.moverDerecha()})
		keyboard.p().onPressDo({ gordoMortero.pegar()})
		keyboard.l().onPressDo({ gordoMortero.activarUlti(gordoMortero.danioAleatorio())})
	// ************ Configuracion teclado Gordo Montero ************
	}

}

