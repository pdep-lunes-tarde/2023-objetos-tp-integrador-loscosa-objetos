import wollok.game.*

object tpIntegrador {
	method jugar() {
		tablero.setearTablero()
		game.boardGround("background.jpg")
		game.addVisual(plataforma)
		game.addVisual(personaje)
		game.whenCollideDo(plataforma,{})
		game.onTick(30,"gravity",{personaje.gravedad()})		
		keyboard.d().onPressDo {
			game.onTick(8,"right",{personaje.moverDerecha()})
			game.schedule(90, {game.removeTickEvent("right")})
		}
		
		keyboard.w().onPressDo { 
			game.onTick(8,"jump",{ personaje.subir() })
			game.schedule(90, { game.removeTickEvent("jump")})
		}
		
		keyboard.a().onPressDo { 
			game.onTick(8,"left",{personaje.moverIzquierda()})
			game.schedule(90, {game.removeTickEvent("left")})
		}
		
		keyboard.s().onPressDo {
			game.onTick(8,"down",{personaje.bajar()})
			game.schedule(90,{game.removeTickEvent("down")})
		}
		
		game.start()
	}
}
//el orden en que se codeen los visuals indica en que "capa" del escenario va a estar. Cuanto mas "después" se defina, más adelante estará
object tablero {
	
	method setearTablero(){
		game.width(200)
		game.height(120)
		game.cellSize(5)
		game.title("UTN Fight")
	}
}

object plataforma {
	var property position = game.center()
	
	method image() = "plataforma.png"
}
object personaje {
	var property position = game.origin()
	var verticalSpeed = 0
	const limiteInfDer = 185
	const limiteSup = 119	
	
	method image() {
	if(verticalSpeed==0)
	return "KirbyWalking/kirbyF1.png"
	else return "KirbyWalking/kirbyJumpF1.png"
	}
	method subir(){
		position = game.at(position.x(),(position.y() + 10).min(limiteSup))
	}
	method bajar(){
		position = game.at(position.x(), (position.y() - 10).max(0))
	}
	method moverIzquierda() {
		position = game.at((position.x() - 6).max(0), position.y())
	}
	method moverDerecha(){
		position = game.at((position.x() + 6).min(limiteInfDer), position.y())
	}
	
    method gravedad() {
        position = game.at(position.x(), (position.y() - verticalSpeed).max(0))
		if (position.y() > 0) { 
            verticalSpeed = + 8
             } 
        else verticalSpeed = 0 
    }
}


