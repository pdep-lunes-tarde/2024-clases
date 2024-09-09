// poder preguntarle a un micro si se puede subir a una persona, para lo cual tienen que darse dos condiciones: que haya lugar en el micro, y que la persona acepte ir en el micro.

class Micro {
	const capacidadSentados
	const capacidadParados
	const volumen
	var cantidadDePasajeros = 0

	method puedeSubirse(unaPersona) {
		return self.hayEspacio() && unaPersona.seSubiria(self)
	}
	method hayEspacio() {
		return self.espacioDisponible() > 0 
	}
	method volumen() {
		return volumen
	}
	method espacioDisponible() {
		return capacidadSentados + capacidadParados - cantidadDePasajeros
	}
	method seSube(persona) {
		if(self.puedeSubirse(persona)) {
			cantidadDePasajeros += 1
		} else {
			self.error("La persona no podia subirse")
		}
	}
}

class Persona {}

class PersonaApurada {
	method seSubiria(micro) {
		return true
	}
}

class PersonaClaustrofobica {
	method seSubiria(micro) {
		return micro.volumen() > 120
	}
}