import wollok.game.*

class Personaje {
	
	var property position = game.origin()
	
	
	
	
	
	
	
	
	
	
	method subir(){
		position = position.up(1)
		
	}
	method bajar(){
		position = game.at(position.x(), (position.y() - 1).max(0))
	}
	method moverIzquierda() {
		position = game.at((position.x() - 1).max(0), position.y())
	}
	method moverDerecha(){
		position = game.at((position.x() + 1).min(18), position.y())
	}
}
