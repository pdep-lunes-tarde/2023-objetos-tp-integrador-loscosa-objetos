import wollok.game.*
import direcciones.*
import tp.*

class Objeto {

	var property position
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

class Personaje inherits Objeto {

	var nombrePersonaje
	var personajeEnemigo
	var property estaSaltando = false
	var property seMueveALaDerecha = false
	var property seMueveALaIzquierda = false
	var property estaPegando = false
	var property areaColision = 1
	var property vidas = 6.max(0)
	var property mana = 1.min(100)
	var property danio = 1

	override method moverA(dir) {
		const proximaPosicion = self.proximaPosicion(dir)
		if (self.puedeMoverseA(proximaPosicion)) {
			position = proximaPosicion
		}
	}

	method image() {
//Salto-----------------------------------------------------
		return if (self.estaSaltando()) {
			nombrePersonaje.toString() + "/upPosition.png"
//Movimiento------------------------------------------------			
		} else if (self.seMueveALaDerecha()) {
			nombrePersonaje.toString() + "/rightPosition.png"
		} else if (self.seMueveALaIzquierda()) {
			nombrePersonaje.toString() + "/leftPosition.png"
//Golpe------------------------------------------------------
		} else if (self.estaPegando() && (self.position().x() > personajeEnemigo.position().x())) {
			nombrePersonaje.toString() + "/fightPosition_Right.png"
		} else if (self.estaPegando() && (self.position().x() < personajeEnemigo.position().x())) {
			nombrePersonaje.toString() + "/fightPosition_Left.png"
//Posición neutral--------------------------------------------
		} else if ((self.position().x() > personajeEnemigo.position().x())) {
			nombrePersonaje.toString() + "/NeutralPosition_Right.png"
		} else {
			nombrePersonaje.toString() + "/NeutralPosition_Left.png"
		}
	}

	method puedeMoverseA(posicion) = self.todosPuedenPisarse(posicion) || self.casilleroVacio(posicion)

	method todosPuedenPisarse(posicion) = game.getObjectsIn(posicion).all({ objeto => objeto.puedePisarse() })

	method casilleroVacio(posicion) = game.getObjectsIn(posicion).isEmpty()

	method proximaPosicion(dir) = dir.siguientePosicion(position)

	method moverIzquierda() {
		self.moverA(izquierda)
		self.seMueveALaIzquierda(true)
	}

	method moverDerecha() {
		self.moverA(derecha)
		self.seMueveALaDerecha(true)
	}

	method saltar() {
		self.moverA(arriba)
		self.estaSaltando(true)
	}

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
		if (position.y() == 0) {
			estaSaltando = false
		}
	}

	method perderVida(danioRecibido) {
		if (vidas <= 0) tpIntegrador.perder() else {
			vidas -= danioRecibido
		}
	}

	method pegar() {
		estaPegando = true
		self.area()
		if (self.areaColision().contains(personajeEnemigo.position().x())) {
			personajeEnemigo.perderVida(self.danio())
		}
		game.sound("sounds/fightSound.mp3").play()
	}

	method area()

	method areaColision() = areaColision

	method animaciones() {
		seMueveALaDerecha = false
		seMueveALaIzquierda = false
		estaSaltando = false
		estaPegando = false
	}


	method cargarUlti() {
		game.onCollideDo(self , { moneda =>
			if(gordoMortero.position().x() != robertoMecanico.position().x()) {
				moneda.esAgarradaPor(self)
				game.removeVisual(moneda)
			}
		})
	}

	method aumentarMana(nuevoValor) {
		mana += nuevoValor
	}
	
	method danioAleatorio() {
		return [1,2,3,4,5].anyOne()	
	}
	
	method activarUlti(_numero) {
		if(self.mana() >= 100) {
			danio = _numero
		} else {
			danio = 1
		}
	}
	
}

object robertoMecanico inherits Personaje (position = game.origin(), nombrePersonaje = "roberto_mecanico", personajeEnemigo = gordoMortero) {

	override method area() {
		areaColision = (self.position().x() + 1 .. self.position().x() - 1)
	}

	override method areaColision() = areaColision

}

object gordoMortero inherits Personaje (position = game.at(18, 0), nombrePersonaje = "gordo_mortero", personajeEnemigo = robertoMecanico) {

	override method area() {
		areaColision = (self.position().x() - 2 .. self.position().x() + 1)
	}

	override method areaColision() = areaColision

}

class Moneda inherits Objeto {

	var property valor

	method image() = "moneda.png"

	override method puedePisarse() = true

	method esAgarradaPor(personaje) {
		personaje.aumentarMana(valor)
	}

}


