import wollok.game.*
import main.*

class Visual {

	var property image

	method position() = game.at(0, 0)

	method mostrar() {
		game.addVisual(self)
	}

}

class Plataforma inherits Objeto {

	method image() = "pared.jpg"

	override method puedePisarse() = false

}

class Borde inherits Objeto {

	override method puedePisarse() = false

}

object plataformaCentral {

	const plataformas = [ new Plataforma(position = game.at(6,6)), new Plataforma(position = game.at(7,6)), new Plataforma(position = game.at(8,6)), new Plataforma(position = game.at(9,6)), new Plataforma(position = game.at(10,6)), new Plataforma(position = game.at(11,6)), new Plataforma(position = game.at(12,6)) ]

	method crear() {
		plataformas.forEach({ plataforma => plataforma.crear()})
	}

}

object bordes {

	method agregar(posiciones, crearBorde) {
		const bordes = posiciones.map(crearBorde)
		bordes.forEach{ borde => game.addVisual(borde)}
	}

	method agregarObjeto(posiciones) {
		self.agregar(posiciones, { pos => new Borde(position = pos)})
	}

	method agregarBordes() {
		const ancho = game.width() - 1
		const largo = game.height() - 1
			/* Bordes Inferiores */
		self.agregarObjeto((0 .. ancho).map{ nro => new Position(x = nro, y = -1)})
			/* Bordes Inferiores */
			/* Bordes Superiores */
		self.agregarObjeto((0 .. ancho).map{ nro => new Position(x = nro, y = 10)})
			/* Bordes Superiores */
			/* Bordes Izquierdos */
		self.agregarObjeto((0 .. largo).map{ nro => new Position(x = -1, y = nro)})
			/* Bordes Izquierdos */
			/* Bordes Derechos */
		self.agregarObjeto((0 .. largo).map{ nro => new Position(x = 20, y = nro)})
	/* Bordes Derechos */
	}

	method crearVisuales() {
		robertoMecanicoVidas.crear()
		gordoMorteroVidas.crear()
		ultiRoberto.crear()
		ultiGordo.crear()
	}

	method aparecerMoneda() {
		const x = (0 .. game.width() - 5).anyOne()
		const y = (0 .. game.height() - 5).anyOne() // asignamos una constante a cada insancia de moneda para poder controlar las instancias por separado
		const moneda = new Moneda(valor = [ 100, 50, 25 ].anyOne(), position = game.at(x, y))
		game.addVisual(moneda)
	}

}

object robertoMecanicoVidas inherits Objeto (position = game.at(0, 11)) {

	override method puedePisarse() = false

	method image() = "roberto_mecanico/vidasRoberto-" + robertoMecanico.vidas().toString() + "corazon.png"

}

object gordoMorteroVidas inherits Objeto (position = game.at(16, 11)) {

	override method puedePisarse() = false

	method image() = "gordo_mortero/vidasGordo-" + gordoMortero.vidas().toString() + "corazon.png"

}

object ultiRoberto inherits Objeto (position = game.at(4, 11)) {

	override method puedePisarse() = false

	method image() {
		return if (robertoMecanico.mana() >= 100) {
			"ultiActivada.png"
		} else {
			"ultiDesactivada.png"
		}
	}

}

object ultiGordo inherits Objeto (position = game.at(15, 11)) {

	override method puedePisarse() = false

	method image() {
		return if (gordoMortero.mana() >= 100) {
			"ultiActivada.png"
		} else {
			"ultiDesactivada.png"
		}
	}

}

const imagenInicio = new Visual(image = "pantallaInicio.png")

const imagenGanadoraRoberto = new Visual(image = "roberto_mecanico/robertoGanador.png")

const imagenGanadoraGordo = new Visual(image = "gordo_mortero/gordoGanador.png")

