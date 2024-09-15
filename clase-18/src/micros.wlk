class Micro {
	const capacidadSentados
	const capacidadParados
	const volumenEnM3
	var cantidadPasajeros= 0
	
	method volumenEnM3() {
		return volumenEnM3
	} 
	
	method hayLugar() {
		return self.capacidadTotal() > cantidadPasajeros
	}
	
	method capacidadTotal() {
		return capacidadSentados + capacidadParados
	}
	
	method hayAsientosLibres() {
		return capacidadSentados > cantidadPasajeros
	}
	
	method seSubieronPersonas(cantidad) {
		cantidadPasajeros += cantidad
	}
}

object pruebita {
	method aplicar(bloque) {
		return bloque.apply()
	}
}

object sumar2y3 {
	method apply() {
		return 5
	}
}

object esPar {
	method apply(numero) {
		return numero % 2 == 0
	}
}

