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

	var property estaSaltando = false
	var property seMueveALaDerecha = false
	var property seMueveALaIzquierda = false
	var property estaPegando = false
	var areaColision = 1
	;
	var property vidas = 6

	method pegar(_) {
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

	method perderVida() {
		if (vidas == 0) tpIntegrador.perder() else {
			vidas -= 1
		}
	}

	method area() {
		areaColision = (position.x() + 1 .. position.x() - 2)
	}

	method areaColision() = areaColision

	method animaciones() {
		seMueveALaDerecha = false
		seMueveALaIzquierda = false
		estaSaltando = false
		estaPegando = false
	}

}

object robertoMecanico inherits Personaje (position = game.origin()) {

	override method moverA(dir) {
		const proximaPosicion = self.proximaPosicion(dir)
		if (self.puedeMoverseA(proximaPosicion)) {
			position = proximaPosicion
		} else {
			game.getObjectsIn(proximaPosicion).forEach({ objeto => objeto.moverA(dir)})
		}
	}

	method image() {
//Salto-----------------------------------------------------
		return if (self.estaSaltando()) {
			"roberto_mecanico/upPosition.png"
//Movimiento------------------------------------------------			
		} else if (self.seMueveALaDerecha()) {
			"roberto_mecanico/rightPosition.png"
		} else if (self.seMueveALaIzquierda()) {
			"roberto_mecanico/leftPosition.png"
//Golpe------------------------------------------------------
		} else if (self.estaPegando() && (self.position().x() > gordoMortero.position().x())) {
			"roberto_mecanico/fightPosition_Right.png"
		} else if (self.estaPegando() && (self.position().x() < gordoMortero.position().x())) {
			"roberto_mecanico/fightPosition_Left.png"
//Posición neutral--------------------------------------------
		} else if ((self.position().x() > gordoMortero.position().x())){
			"roberto_mecanico/NeutralPosition_Right.png" 
		} else {
			"roberto_mecanico/NeutralPosition_Left.png"
		}
	}

	method pegar() {
		estaPegando = true
		self.area()
		if (self.areaColision().contains(gordoMortero.position().x())) {
			gordoMortero.perderVida()
		}
		game.sound("sounds/fightSound.mp3").play()
	}

}

object gordoMortero inherits Personaje (position = game.at(18, 0)) {

	override method moverA(dir) {
		const proximaPosicion = self.proximaPosicion(dir)
		if (self.puedeMoverseA(proximaPosicion)) {
			position = proximaPosicion
		} else {
			game.getObjectsIn(proximaPosicion).forEach({ objeto => objeto.moverA(dir)})
		}
	}

	method image() {
		return if (self.estaSaltando()) {
			"gordo_mortero/upPosition.png"
		} else if (self.seMueveALaDerecha()) {
			"gordo_mortero/rightPosition.png"
		} else if (self.seMueveALaIzquierda()) {
			"gordo_mortero/leftPosition.png"
		} else if (self.estaPegando() && (self.position().x() > robertoMecanico.position().x())) {
			"gordo_mortero/fightPosition_Right.png"
		} else if (self.estaPegando() && (self.position().x() < robertoMecanico.position().x())) {
			"gordo_mortero/fightPosition_Left.png"
//Posición neutral--------------------------------------------
		} else if ((self.position().x() > robertoMecanico.position().x())){
			"gordo_mortero/NeutralPosition_Right.png" 
		} else {
			"gordo_mortero/NeutralPosition_Left.png"
		}

	override method area() {
		areaColision = (position.x() - 2 .. position.x() + 1)
	}

	override method areaColision() = areaColision

	method pegar() {
		estaPegando = true
		self.area()
		if (self.areaColision().contains(robertoMecanico.position().x())) {
			robertoMecanico.perderVida()
		}
		game.sound("sounds/fightSound.mp3").play()
	}

}

class Plataforma inherits Objeto {

	method image() = "pared.jpg"

	override method puedePisarse() = false

}

class Borde inherits Objeto {

	override method puedePisarse() = false

}

//class Moneda inherits Objeto{
//	var property valor
//	
//	method image() = "pared.jpg"
//	
//	override method puedePisarse() = true
//}
//class Personaje2 {
//
//	var property position = game.origin()
//
//
//	// var vida = 1000;
//	// var mana = 0;
//	method image() {
//		return if (self.estaSaltando()) {
//			"roberto_mecanico/upPosition.png"
//		} else if (self.seMueveALaDerecha()) {
//			"roberto_mecanico/rightPosition.png"
//		} else if (self.seMueveALaIzquierda()) {
//			"roberto_mecanico/leftPosition.png"
//		} else {
//			"roberto_mecanico/originalPosition.png"
//		}
//	}
//
//	method subir() {
//		self.moverA(arriba)
//	}
//
//	method bajar() {
//		if (position.y() > 0) {
//			position = game.at(position.x(), (position.y() - 0.5))
//		}
//	}
//
//	method moverIzquierda() {
//		if (position.x() > 0) {
//			position = game.at((position.x() - 1), position.y())
//		}
//	}
//
//	method moverDerecha() {
//		if (position.x() < (game.width() - 2)) {
//			position = game.at((position.x() + 1), position.y())
//		}
//	}
//
//	method actualizar() {
//		if (position.y() > 0) {
//			self.caer()
//		}
//		if (position.y() == 0) {
//			
//		}
//	}
//
//	
//
//	method caer() {
//		game.schedule(500, { self.bajar()})
//	}
//
//	method choqueConPlataforma() {
//		position = game.at(0, 0)
//	}
//
//	method inicializar() {
//		game.addVisual(self)
//		keyboard.d().onPressDo{ self.moverDerecha()
//			seMueveALaDerecha = true
//		}
//		keyboard.w().onPressDo{ self.subir()
//			estaSaltando = true
//		}
//		keyboard.a().onPressDo{ self.moverIzquierda()
//			seMueveALaIzquierda = true
//		}
//		keyboard.s().onPressDo{ self.bajar()}
//	}
//
//	method puedeMoverseA(posicion) = self.todosPuedenPisarse(posicion) || self.casilleroVacio(posicion)
//
//	method todosPuedenPisarse(posicion) = game.getObjectsIn(posicion).all({ objeto => objeto.puedePisarse() })
//
//	method casilleroVacio(posicion) = game.getObjectsIn(posicion).isEmpty()
//
//	method proximaPosicion(dir) = dir.siguientePosicion(position)
//
//	method moverA(dir) {
//		const proximaPosicion = self.proximaPosicion(dir)
//		if (self.puedeMoverseA(proximaPosicion)) {
//			position = proximaPosicion
//		} else {
//			game.getObjectsIn(proximaPosicion).forEach({ objeto => objeto.moverA(dir)})
//		}
//	}
//
//}
