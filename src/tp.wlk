import wollok.game.*

object tpIntegrador {
	method jugar() {
		tablero.setearTablero()
		game.boardGround("background.jpg")
		game.addVisual(personaje)
		game.onTick(40,"gravity",{personaje.bajar()})		
		keyboard.d().onPressDo { personaje.moverDerecha() }
		keyboard.w().onPressDo { 
			game.onTick(10,"jump",{ personaje.subir() })
			game.schedule(210, { game.removeTickEvent("jump") })
		}
		keyboard.a().onPressDo { personaje.moverIzquierda() }
		keyboard.s().onPressDo { personaje.bajar() }
		game.start()
	}
}

object tablero {
	
	method setearTablero(){
		game.width(20)
		game.height(12)
		game.cellSize(50)
		game.title("UTN Fight")
	}
}

object personaje {
	var property position = game.center()
	method image() = "personaje.png";
	
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
		position = position.right(1)
	}
	
}
/*
 * object plataforma {
	method image () =
 * 
 */
