import wollok.game.*

class Visual {
	var property image
	method position() = game.at(0,0)
	
	method mostrar(){ game.addVisual(self) }
}

const imagenInicio = new Visual(image = "pantallaInicio.png")