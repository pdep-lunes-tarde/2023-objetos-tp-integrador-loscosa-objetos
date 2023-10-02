import wollok.game.*

object tpIntegrador {
	method jugar() {
		tablero.setearTablero()
		game.boardGround("background.jpg")
		game.addVisual(personaje)
		game.onTick(14,"gravity",{personaje.actualizar()})		
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
	var property position = game.origin()
	var verticalSpeed = 0	
	
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
		position = game.at((position.x() + 1).min(18), position.y())
	}
	
	
	
	method saltar() {
        verticalSpeed = 10  
    }

    method actualizar() {
        position = game.at(position.x(), position.y() - verticalSpeed)

        if (position.y() < 10) { 
            verticalSpeed = 0
            position = game.at(position.x(), 0) 
        } else {
            verticalSpeed -= 0.1 
        }
    }
	
	

	
}
/*
 * object plataforma {
	method image () =
 * 
 */
