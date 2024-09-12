class Pasajero {
	var personalidad
	var jefe = sinJefe

	method sePuedeSubir(unMicro) {
		return unMicro.hayLugar() && personalidad.aceptaSubirse(unMicro, jefe)
	}
}

object sinJefe {
	method sePuedeSubir(unMicro) {
		return true
	}
}

object obsecuente {
	method aceptaSubirse(unMicro, jefe) {
		return jefe.sePuedeSubir(unMicro)
	}
}


object apurado {
	method aceptaSubirse(unMicro, jefe) {
		return true
	}
}

object claustrofobico {
	method aceptaSubirse(unMicro, jefe) {
		return unMicro.volumenEnM3() > 120
	}
}

object fiaca {
	method aceptaSubirse(unMicro, jefe) {
		return unMicro.hayAsientosLibres()
	}
}



