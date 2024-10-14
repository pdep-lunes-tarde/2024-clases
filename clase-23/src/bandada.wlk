import ave.*

class Bandada {
	const aves
	
	method descansar() {
		aves.forEach { unAve => unAve.descansar() }
	}
	
	method volarA(destino) {
		try {
			self.validarQuePuedenVolarA(destino)
			aves.forEach { unAve => unAve.volarA(destino) }			
		} catch excepcion: NoSePuedeVolarException {
			self.descansar()
			throw excepcion
		}
	}
	
	method transportarA(destino) {
		self.validarQuePuedenVolarA(destino)
		aves.forEach { unAve => unAve.transportarA(destino) }
	}

	method validarQuePuedenVolarA(destino) {
		aves.forEach { unAve => unAve.validarQuePuedeVolarA(destino) }
	}
}

