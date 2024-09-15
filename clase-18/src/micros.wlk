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

