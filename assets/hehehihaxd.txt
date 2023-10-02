import wollok.game.*

class Proyectil {
	var property position = nave.position().up(1)
	var nro
	
	method moverse() {
		position = position.up(1)
		if(position.y() > game.height())
			self.sacar()
	}
	
	method image() = "bala.png"
	
	
	method empezarAMoverse() {
				
		game.onTick(100,"moverBala"+nro,{self.moverse()})
		game.onCollideDo(self,{
			enemigo => enemigo.destruir()
			self.sacar()
		})
	}
	 method sacar(){
	 	game.removeTickEvent("moverBala"+nro)
	 	game.removeVisual(self)
	 }
	
	
}

object nave {
	var position = game.center().down(5)
	var nroBala = 0
	method image() = "player.png"
	method position() = position
	
	method derecha() {
		position = position.right(1)
	}
	method izquierda() {
		position = position.left(1)
	}
	method disparar(){
		nroBala = nroBala + 1
		const bala = new Proyectil(nro = nroBala)
		game.addVisual(bala)
		bala.empezarAMoverse() 
	}
	
}

class Enemigo {

	var nro
	var position 
	
	method position() = position

	method image() = "invader" + nro + ".png"

	method destruir() {
		nro = nro -2
		if(nro <= 0 ){
			game.removeVisual(self)
			pantalla.quitarEnemigo(self)
			}		
	}
	
	method moverse() {
		position = position
			.down([0,1].anyOne())
			.left([-1,0,1].anyOne())
	}
}

object pantalla {
	const enemigos = []
	const cantEnemigos = 10
	
	method iniciar() {
		
		self.configuracionBasica()
		self.agregarVisuales()
		self.programarTeclas()
		self.definirColisiones()
				
	}
	method configuracionBasica() {
		game.width(15)
		game.height(12)
		game.title("Juego")
//		game.cellSize(40)
//		game.boardGround("imagenDeFondo.jpg")
	}
	method agregarVisuales() {
		game.addVisual(nave)
		cantEnemigos.times{i=>
			self.agregarEnemigo(i)
		}
 
	}
	method programarTeclas() {
		keyboard.right().onPressDo{nave.derecha()} 
		keyboard.left().onPressDo{nave.izquierda()} 
		keyboard.space().onPressDo{nave.disparar()} 
	}
	method definirColisiones() {
		game.onTick(1000,"movimientoEnemigos",{self.moverseTodos()})
	}
	method agregarEnemigo(valor) {
		const enemigo = new Enemigo(nro = valor % 5 +1, position = game.at(valor + 2 ,game.height()- 1) )
		game.addVisual(enemigo)
		enemigos.add(enemigo)    
	}
	method moverseTodos() {
		enemigos.forEach{e=>e.moverse()} 
	}
	method quitarEnemigo(e){
		enemigos.remove(e)
	}
}
