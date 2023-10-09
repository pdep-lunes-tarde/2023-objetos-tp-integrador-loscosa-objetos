import wollok.game.*

class Plataforma {
	
	var property position = game.at(3,5.5)

	method image() = "plataforma.png";
	
	method inicializar(){
		game.addVisual(self)
	}
}
