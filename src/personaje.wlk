import wollok.game.*

class Personaje {

	var property position = game.origin()
	var property estaSaltando = false

	// var vida = 1000;
	// var mana = 0;
	method image() = if (!self.estaSaltando()) "animation_kirby/kirbyWalkingFr4.png" else "animation_kirby/kirbyJumpFr1.png"

	method subir() {
		if (position.y() < 9.5) {
			position = position.up(3.5)
		}
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
		if(position.y() == 0) {
			estaSaltando = false
		}
	}

	method caer() {
		game.schedule(500, { self.bajar()})
	}

	method choqueConPlataforma() {
		position = game.at(0, 0)
	}

	method inicializar() {
		game.addVisual(self)
		keyboard.d().onPressDo{ self.moverDerecha()}
		keyboard.w().onPressDo{ 
			self.subir()
			estaSaltando = true 
		}
		keyboard.a().onPressDo{ self.moverIzquierda()}
		keyboard.s().onPressDo{ self.bajar()}
	}

}

