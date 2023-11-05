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
		
		keyboard.enter().onPressDo{self.iniciarPelea()}
		
		
		game.start()
	}

	method iniciarPelea() {
		game.clear()
		plataformaCentral.crear()
		bordes.crear()
		config.agregarPersonajes()
		config.configurarTeclado()
		game.onTick(30, "gravity", { robertoMecanico.actualizar()})
		game.onTick(145, "animaciones", { robertoMecanico.animaciones()})
	}

	method perder() {
		game.clear()
	// imagenPerdedora.mostrar()
	}

}




