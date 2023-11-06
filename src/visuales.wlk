import wollok.game.*
import main.*
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
	//var rangoDeBordes = 0..20
	
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
		new Borde(position = game.at(0,10)),
		new Borde(position = game.at(1,10)),
		new Borde(position = game.at(2,10)),
		new Borde(position = game.at(3,10)),
		new Borde(position = game.at(4,10)),
		new Borde(position = game.at(5,10)),
		new Borde(position = game.at(6,10)),
		new Borde(position = game.at(7,10)),
		new Borde(position = game.at(8,10)),
		new Borde(position = game.at(9,10)),
		new Borde(position = game.at(10,10)),
		new Borde(position = game.at(11,10)),
		new Borde(position = game.at(12,10)),
		new Borde(position = game.at(13,10)),
		new Borde(position = game.at(14,10)),
		new Borde(position = game.at(15,10)),
		new Borde(position = game.at(16,10)),
		new Borde(position = game.at(17,10)),
		new Borde(position = game.at(18,10)),
		new Borde(position = game.at(19,10)),
		new Borde(position = game.at(20,10)),
		// ---------- Bordes Superiores ----------
		
		// ---------- Bordes Plataforma ----------
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
		robertoMecanicoVidas.crear()
		gordoMorteroVidas.crear()
		robertoMecanicoBurst.crear()
		gordoMorteroBurst.crear()
	}
	
	method aparecerMoneda() {
		const x = (0..game.width()-1).anyOne()
		const y = (0..game.height()-1).anyOne()//asignamos una constante a cada insancia de moneda para poder controlar las instancias por separado
		 const ulti = new Moneda( valor = [1,5,10].anyOne(), position = game.at(x,y))
		game.addVisual(ulti)
		game.schedule(3000,{ game.removeVisual(ulti)}) //como la constante "ulti" referencia a "Moneda", cuando removemos "ulti", removemos el objeto al que se referencia.
		
	}
}
	
object robertoMecanicoVidas inherits Objeto (position = game.at(0,11))  {
	
	override method puedePisarse() = false
	
	method image() = "roberto_mecanico/vidasRoberto-" + robertoMecanico.vidas().toString() + "corazon.png"
}

object gordoMorteroVidas inherits Objeto (position = game.at(16,11))  {
	
	override method puedePisarse() = false
	
	method image() = "gordo_mortero/vidasGordo-" + gordoMortero.vidas().toString() + "corazon.png"
}

object robertoMecanicoBurst inherits Objeto (position = game.at(0,10)) {
	
	override method puedePisarse() = false
	method image()= "Ulti_Enabled.png"
}
object gordoMorteroBurst inherits Objeto (position = game.at(18,10)) {
	
	override method puedePisarse() = false
	method image()= "Ulti_Enabled.png"
}

const imagenInicio = new Visual(image = "pantallaInicio.png")

const imagenGanadoraRoberto = new Visual (image = "roberto_mecanico/robertoGanador.png")

const imagenGanadoraGordo = new Visual (image = "gordo_mortero/gordoGanador.png")

