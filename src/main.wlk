import wollok.game.*
import direcciones.*

class Objeto {

	var property position = game.origin()
	var property puedePisarse = true

	method crear() {
		game.addVisual(self)
	}

	method moverA(_) {
	}

	method colisionarConPersonaje(_) {
	}

	method mismaPosicionQue(otroObjeto) = self.position() == otroObjeto.position()

}

class ObjetoMovible inherits Objeto {

	override method moverA(dir) {
		const proximaPosicion = self.proximaPosicion(dir)
		if (self.puedeMoverseA(proximaPosicion)) {
			position = proximaPosicion
		}
	}

	method puedeMoverseA(posicion) = self.todosPuedenPisarse(posicion) || self.casilleroVacio(posicion)

	method todosPuedenPisarse(posicion) = game.getObjectsIn(posicion).all({ objeto => objeto.puedePisarse() })

	method casilleroVacio(posicion) = game.getObjectsIn(posicion).isEmpty()

	method proximaPosicion(dir) = dir.siguientePosicion(position)

}

class Personaje inherits ObjetoMovible {

	// method pegar() = {}
	method morir() = game.stop()
	
	method bajar() {
		const proximaPosicion = self.proximaPosicion(abajo)
		if (position.y() > 0 && self.puedeMoverseA(proximaPosicion)) {
			position = game.at(position.x(), (position.y() - 0.5))
		}
	}
	
	method caer() {
		game.schedule(500, { self.bajar()})
	}
	
	method actualizar() {
		if (position.y() > 0) {
			self.caer()
		}
		if(position.y() == 0) {
		}
	}

}

object robertoMecanico inherits Personaje {

	method image() = "roberto_mecanico/originalPosition.png"

	override method moverA(dir) {
		const proximaPosicion = self.proximaPosicion(dir)
		if (self.puedeMoverseA(proximaPosicion)) {
			position = proximaPosicion
		} else {
			game.getObjectsIn(proximaPosicion).forEach({ objeto => objeto.moverA(dir)})
		}
	}

}

class Plataforma inherits Objeto {

	method image() = "pared.jpg"

	override method puedePisarse() = false

}

class Borde inherits Objeto {
	
	override method puedePisarse() = false
}

class Moneda inherits Objeto{
	var property valor
	
	method image() = "pared.jpg"
	
	override method puedePisarse() = true
}











































class Personaje2 {

	var property position = game.origin()
	var property estaSaltando = false
	var property seMueveALaDerecha = false
	var property seMueveALaIzquierda = false

	// var vida = 1000;
	// var mana = 0;
	method image() {
		return if (self.estaSaltando()) {
			"roberto_mecanico/upPosition.png"
		} else if (self.seMueveALaDerecha()) {
			"roberto_mecanico/rightPosition.png"
		} else if (self.seMueveALaIzquierda()) {
			"roberto_mecanico/leftPosition.png"
		} else {
			"roberto_mecanico/originalPosition.png"
		}
	}

	method subir() {
		self.moverA(arriba)
	}

	method bajar() {
		if (position.y() > 0) {
			position = game.at(position.x(), (position.y() - 0.5))
		}
	}

	method moverIzquierda() {
		if (position.x() > 0) {
			position = game.at((position.x() - 1), position.y())
		}
	}

	method moverDerecha() {
		if (position.x() < (game.width() - 2)) {
			position = game.at((position.x() + 1), position.y())
		}
	}

	method actualizar() {
		if (position.y() > 0) {
			self.caer()
		}
		if (position.y() == 0) {
			estaSaltando = false
		}
	}

	method animaciones() {
		seMueveALaDerecha = false
		seMueveALaIzquierda = false
		estaSaltando = false
	}

	method caer() {
		game.schedule(500, { self.bajar()})
	}

	method choqueConPlataforma() {
		position = game.at(0, 0)
	}

	method inicializar() {
		game.addVisual(self)
		keyboard.d().onPressDo{ self.moverDerecha()
			seMueveALaDerecha = true
		}
		keyboard.w().onPressDo{ self.subir()
			estaSaltando = true
		}
		keyboard.a().onPressDo{ self.moverIzquierda()
			seMueveALaIzquierda = true
		}
		keyboard.s().onPressDo{ self.bajar()}
	}

	method puedeMoverseA(posicion) = self.todosPuedenPisarse(posicion) || self.casilleroVacio(posicion)

	method todosPuedenPisarse(posicion) = game.getObjectsIn(posicion).all({ objeto => objeto.puedePisarse() })

	method casilleroVacio(posicion) = game.getObjectsIn(posicion).isEmpty()

	method proximaPosicion(dir) = dir.siguientePosicion(position)

	method moverA(dir) {
		const proximaPosicion = self.proximaPosicion(dir)
		if (self.puedeMoverseA(proximaPosicion)) {
			position = proximaPosicion
		} else {
			game.getObjectsIn(proximaPosicion).forEach({ objeto => objeto.moverA(dir)})
		}
	}

}

