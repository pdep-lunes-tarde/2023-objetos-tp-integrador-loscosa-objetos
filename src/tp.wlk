import wollok.game.*
import plataforma.*
import visuales.*
import configuraciones.*
import main.*

object tpIntegrador {

	method iniciar() {
		config.configurarTablero()
		imagenInicio.mostrar()
		keyboard.enter().onPressDo{ self.iniciarPelea()}
		keyboard.enter().onPressDo{ self.iniciarPelea()}
		game.start()
	}

	method iniciarPelea() {
		game.clear()
		plataformaCentral.crear()
		bordes.crear()
		config.agregarPersonajes()
		config.configurarTeclado()
		game.onTick(30, "gravity", { robertoMecanico.actualizar() gordoMortero.actualizar()})
		game.onTick(145, "animaciones", { robertoMecanico.animaciones()
			gordoMortero.animaciones()
		})
		const backgroundSound = game.sound("sounds/backgroundSound.mp3")
		backgroundSound.shouldLoop(true)
		game.schedule(500, { backgroundSound.play()})
	}

	method perder() {
		game.clear()
		game.sound("sounds/winnerSound.mp3").play()
		if(robertoMecanico.vidas() == 0) {
			game.addVisual(imagenGanadoraGordo)
		}
		else {
			game.addVisual(imagenGanadoraRoberto)
		}
	}

}

