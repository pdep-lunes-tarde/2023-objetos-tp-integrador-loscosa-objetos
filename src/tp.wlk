import wollok.game.*
import plataforma.*
import visuales.*
import configuraciones.*
import main.*

object tpIntegrador {

	method iniciar() {
		config.configurarTablero()
		imagenInicio.mostrar()
<<<<<<< HEAD
		keyboard.enter().onPressDo{ self.iniciarPelea()}
=======
		
		keyboard.enter().onPressDo{self.iniciarPelea()}
		
		
		
		
>>>>>>> 856f5152a491f8f4c5ba8466e8e5867499a5999e
		game.start()
	}

	method iniciarPelea() {
		game.clear()
		plataformaCentral.crear()
		bordes.crear()
		config.agregarPersonajes()
		config.configurarTeclado()
<<<<<<< HEAD
		game.onTick(30, "gravity", { robertoMecanico.actualizar()})
		game.onTick(145, "animaciones", { robertoMecanico.animaciones()})
	}

	method perder() {
		game.clear()
	// imagenPerdedora.mostrar()
	}

}
=======
		game.onTick(30,"gravity",{robertoMecanico.actualizar()})
		game.onTick(300, "apareceMoneda",{bordes.aparecerMoneda()})
		
		}
		//game.onTick(160,"animations",{personaje.animaciones()})
	}

>>>>>>> 856f5152a491f8f4c5ba8466e8e5867499a5999e

