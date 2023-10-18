import wollok.game.*
import main.*

class Visual {

	var property image

	method position() = game.at(0, 0)

	method mostrar() {
		game.addVisual(self)
	}

}

object plataformaCentral {

	const plataformas= [
		
	new Plataforma(position = game.at(6,6)),
	new Plataforma(position = game.at(7,6)),
	new Plataforma(position = game.at(8,6)),
	new Plataforma(position = game.at(9,6)),
	new Plataforma(position = game.at(10,6)),
	new Plataforma(position = game.at(11,6)),
	new Plataforma(position = game.at(12,6))
	]
	
	method crear(){
		plataformas.forEach({plataforma => plataforma.crear()})
	}
}

object bordes{
	
	const bordes = [
		
		// ---------- Bordes Inferiores ----------
		new Borde(position = game.at(0,-1)),
		new Borde(position = game.at(1,-1)),
		new Borde(position = game.at(2,-1)),
		new Borde(position = game.at(3,-1)),
		new Borde(position = game.at(4,-1)),
		new Borde(position = game.at(5,-1)),
		new Borde(position = game.at(6,-1)),
		new Borde(position = game.at(7,-1)),
		new Borde(position = game.at(8,-1)),
		new Borde(position = game.at(9,-1)),
		new Borde(position = game.at(10,-1)),
		new Borde(position = game.at(11,-1)),
		new Borde(position = game.at(12,-1)),
		new Borde(position = game.at(13,-1)),
		new Borde(position = game.at(14,-1)),
		new Borde(position = game.at(15,-1)),
		new Borde(position = game.at(16,-1)),
		new Borde(position = game.at(17,-1)),
		new Borde(position = game.at(18,-1)),
		new Borde(position = game.at(19,-1)),
		new Borde(position = game.at(20,-1)),
		// ---------- Bordes Inferiores ----------
		
		// ---------- Bordes Izquierda -----------
		new Borde(position = game.at(-1,0)),
		new Borde(position = game.at(-1,1)),
		new Borde(position = game.at(-1,2)),
		new Borde(position = game.at(-1,3)),
		new Borde(position = game.at(-1,4)),
		new Borde(position = game.at(-1,5)),
		new Borde(position = game.at(-1,6)),
		new Borde(position = game.at(-1,7)),
		new Borde(position = game.at(-1,8)),
		new Borde(position = game.at(-1,9)),
		new Borde(position = game.at(-1,10)),
		new Borde(position = game.at(-1,11)),
		new Borde(position = game.at(-1,12)),
		// ---------- Bordes Izquierda -----------
		
		// ---------- Bordes Derecha -----------
		new Borde(position = game.at(20,0)),
		new Borde(position = game.at(20,1)),
		new Borde(position = game.at(20,2)),
		new Borde(position = game.at(20,3)),
		new Borde(position = game.at(20,4)),
		new Borde(position = game.at(20,5)),
		new Borde(position = game.at(20,6)),
		new Borde(position = game.at(20,7)),
		new Borde(position = game.at(20,8)),
		new Borde(position = game.at(20,9)),
		new Borde(position = game.at(20,10)),
		new Borde(position = game.at(20,11)),
		new Borde(position = game.at(20,12)),
		// ---------- Bordes Derecha -----------
		
		// ---------- Bordes Superiores ----------
		new Borde(position = game.at(0,11)),
		new Borde(position = game.at(1,11)),
		new Borde(position = game.at(2,11)),
		new Borde(position = game.at(3,11)),
		new Borde(position = game.at(4,11)),
		new Borde(position = game.at(5,11)),
		new Borde(position = game.at(6,11)),
		new Borde(position = game.at(7,11)),
		new Borde(position = game.at(8,11)),
		new Borde(position = game.at(9,11)),
		new Borde(position = game.at(10,11)),
		new Borde(position = game.at(11,11)),
		new Borde(position = game.at(12,11)),
		new Borde(position = game.at(13,11)),
		new Borde(position = game.at(14,11)),
		new Borde(position = game.at(15,11)),
		new Borde(position = game.at(16,11)),
		new Borde(position = game.at(17,11)),
		new Borde(position = game.at(18,11)),
		new Borde(position = game.at(19,11)),
		new Borde(position = game.at(20,11)),
		// ---------- Bordes Superiores ----------
		
		// ---------- Bordes Plataforma ----------
		new Borde(position = game.at(5,5)),
		new Borde(position = game.at(6,5)),
		new Borde(position = game.at(7,5)),
		new Borde(position = game.at(8,5)),
		new Borde(position = game.at(9,5)),
		new Borde(position = game.at(10,5)),
		new Borde(position = game.at(11,5))
		// ---------- Bordes Plataforma ----------
	]
	
	method crear(){
		bordes.forEach({borde => borde.crear()})
	}
}

const imagenInicio = new Visual(image = "pantallaInicio.png")

