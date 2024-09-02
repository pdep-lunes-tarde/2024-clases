// Pepita es una golondrina que puede volar y comer.
// Nos interesará consultar cuál es su energía antes y después de volar y comer (o en cualquier otro momento que querramos).

// Sabemos que:
// Al volar gasta 5 joules de energía por cada kilómetro volado, más 40 joules para comenzar a volar.
// Por cada gramo que come gana 2 joules de energía.
// Inicialmente su energía es 100 joules.


object pepita {
	var energia = 100

	// mensajes de CONSULTA
	method energia() {
		return energia
	}

	// mensajes de EFECTO
	method come(gramosDeAlpiste) {
		energia = energia + gramosDeAlpiste * 2
	}
	method vola(kilometros) {
		energia =
			(energia - kilometros * 5 - 40).max(0)
	}
}

// pepita.vola(2)
// pepita.come(8)
// pepita.energia()

// objeto.mensaje(parametros)

// Josefa es una paloma que también puede volar y comer, sólo que distinto.
// Nos interesará consultar cuál es su energía, que se calcula en base a su energía inicial (80), cuántos kilómetros voló y cuántos gramos comió.
// La energia de josefa es igual a: su energia inicial (80) + 3 por cada gramo comido - 5 por cada kilometro volado
// Además a Josefa le podremos preguntar cómo se siente. Ampliaremos… 

object josefa {
	const energiaInicial = 80
	var gramosComidos = 0
	var kilometrosVolados = 0

	method come(gramosDeAlpiste) {
		gramosComidos = gramosComidos + gramosDeAlpiste
	}

	method vola(kilometros) {
		kilometrosVolados = kilometrosVolados + kilometros
	}

	method energia() {
		return energiaInicial
					+ 3 * gramosComidos
					- 5 * kilometrosVolados
	}

	method comoTeSentis() {
		if(self.energia() > energiaInicial) {
			return "Energica"
		} else if(gramosComidos > kilometrosVolados) {
			return "Bonita y gordita"
		} else {
			return "Indiferente"
		}
	}
}

// Queremos poder preguntarle a Josefa cómo se siente, y debe respondernos:
// "Bonita y gordita" si le dimos más de comer de lo que la hicimos volar
// "Enérgica" si su energía es mayor a su energía inicial
// "Indiferente" en cualquier otro caso


// Agregamos a nuestro sistema a un entrenador. Su rutina de entrenamiento para un parajito es la siguiente:

// Darle de comer 10 gramos de alpiste
// Mandarlo a volar 20 kilómetros
// Si luego de volar la energía del pajarito es menor a 20, darle de comer 10 gramos de alpiste, de lo contrario darle de comer 2 gramos.

object entrenador {
	method entrena(pajaro) {
		pajaro.come(10)
		pajaro.vola(20)
		if(pajaro.energia() < 20) {
			pajaro.come(10)
		} else {
			pajaro.come(2)
		}
	}
}

// Vamos a agregar un ave que tiene una compañera, su nombre es beti y se va a comportar así: su energía va a ser la misma que la de su compañera, cuando come x cantidad, le da de comer la mitad a su compañera, y cuando vuela x kms, su compañera también.

object beti {
	var companiera = pepita

	method cambiarCompaniera(nuevaCompaniera) {
		companiera = nuevaCompaniera
	}

	method come(gramosDeAlpiste) {
		companiera.come(gramosDeAlpiste / 2)
	}

	method vola(kilometros){
		companiera.vola(kilometros)
	}

	method energia(){
		return companiera.energia()
	}
}
