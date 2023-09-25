import wollok.game.*

object tpIntegrador {
	method jugar() {
		tablero.setearTablero()
		game.boardGround("background.jpg")
		game.start()
		game.addVisual(personaje)
		
		keyboard.d().onPressDo { personaje.movete() }
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
	
	method movete() {
    const x = 0.randomUpTo(game.width()).truncate(0)
    const y = 0.randomUpTo(game.height()).truncate(0)

    position = game.at(x,y) 
  }
	
}
