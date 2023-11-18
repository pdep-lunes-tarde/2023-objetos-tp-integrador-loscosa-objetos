import wollok.game.*
import visuales.*
import configuraciones.*
import main.*

object tpIntegrador {

	method iniciar() {
		config.configurarTablero()
		imagenInicio.mostrar()
		keyboard.enter().onPressDo{ self.iniciarPelea()}
		game.start()
	}

	method iniciarPelea() {
		game.clear()
		plataformaCentral.crear()
		bordes.agregarBordes()
		bordes.crearVisuales()
		config.agregarPersonajes()
		config.configurarTeclado()
		self.timers()
	}

	method perder() {
		game.clear()
		game.sound("sounds/winnerSound.mp3").play()
		if (robertoMecanico.vidas() == 0) {
			game.addVisual(imagenGanadoraGordo)
		} else {
			game.addVisual(imagenGanadoraRoberto)
		}
	}

	method timers() {
		game.onTick(30, "gravity", { robertoMecanico.actualizar()
			gordoMortero.actualizar()
		})
		game.onTick(145, "animaciones", { robertoMecanico.animaciones()
			gordoMortero.animaciones()
		})
		game.onTick(300, "monedas", { bordes.aparecerMoneda()
			gordoMortero.cargarUlti()
			robertoMecanico.cargarUlti()
			console.println(robertoMecanico.mana())
		})
		game.onTick(50, "ultis", { 
			ultiRoberto.image()
			ultiGordo.image()
		})
		game.schedule(5000, { game.removeTickEvent("monedas")})
		const backgroundSound = game.sound("sounds/backgroundSound.mp3")
		backgroundSound.shouldLoop(true)
		game.schedule(500, { backgroundSound.play()})
	}

}

