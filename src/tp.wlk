import wollok.game.*

object tpIntegrador {
	method jugar() {
		tablero.setearTablero()
		game.boardGround("background.jpg")
		game.addVisual(personaje)
				
		keyboard.d().onPressDo { personaje.moverDerecha() }
		keyboard.w().onPressDo { 
			game.onTick(70,"salto",{ personaje.subir() })
			game.schedule(300, { game.removeTickEvent("salto") })
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
	var property position = game.origin()
	method image() = "personaje.png";
	
	method subir(){
		position = position.up(1)
		
	}
	method bajar(){
		position = position.down(1)
	}
	method moverIzquierda() {
		position = position.left(1)
	}
	method moverDerecha(){
		position = position.right(1)
	}
	
}
