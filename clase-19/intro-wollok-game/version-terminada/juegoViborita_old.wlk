import wollok.game.*
import direcciones.*

object viborita {
    var property position = game.center()
    var direccion = arriba
    var proximaDireccion = arriba
    const partes = []

    method direccion(nuevaDireccion) {
        if(!direccion.esOpuestaDe(nuevaDireccion)){
            proximaDireccion = nuevaDireccion
        }
    }

    method proximaPosicionDesde(unaPosicion) {
        return direccion.proximaPosicion(unaPosicion)
    }

    method move() {
        direccion = proximaDireccion
        var posicionVieja = position
        position = self.proximaPosicionDesde(position)
        
        partes.forEach { parte =>
            const nuevaPosicionDeParte = posicionVieja
            posicionVieja = parte.position()
            parte.position(nuevaPosicionDeParte)
        }

        if(partes.any { parte => parte.position() == position}) {
            self.perdiste()
        }
    }
    method position() {
        return position
    }
    method image() {
        return "viborita_segmento.png"
    }
    method perdiste() {
        position = game.center()
        direccion = arriba
        juegoViborita.resetear()
        partes.forEach { parte => game.removeVisual(parte) }
        partes.clear()
    }
    method agarrasteManzana(){
        const parte = new ParteDeVibora(position=self.position())
        partes.add(parte)
        game.addVisual(parte)
    }
}

class ParteDeVibora {
    var property position

    method image() {
        return "viborita_segmento.png"
    }

    method chocasteConViborita(vibora) {
        // vibora.perdiste()
    }
}

class Manzana {
    const position

    method position() {
        return position
    }

    method image() {
        return "manzana.png"
    }

    method chocasteConViborita(vibora) {
        vibora.agarrasteManzana()
        juegoViborita.seAgarroManzana(self)
    }
}

class Pared {
    var position

    method position(nuevaPosicion) {
        position = nuevaPosicion
    }

    method position() {
        return position
    }

    method image() {
        return "pared.png"
    }

    method chocasteConViborita(vibora) {
        vibora.perdiste()
    }
}

class Portal {
    var property position
    var property otroPortal = self

    method chocasteConViborita(vibora) {
        const nuevaPosicion = vibora.proximaPosicionDesde(otroPortal.position())
        vibora.position(nuevaPosicion)
    }

    method image() {
        return "portal.png"
    }
}

object indicadorDePuntaje {
    method text() {
        return "Puntaje: " + juegoViborita.puntaje().toString()
    }

    method textColor() {
        return "000000"
    }

    method position() {
        return game.at(1, game.height() - 1)
    }
}

object indicadorDeNivel {
    method text() {
        return "Nivel: " + juegoViborita.nivel().toString()
    }

    method textColor() {
        return "000000"
    }

    method position() {
        return game.at(game.width() - 2, game.height() - 1)
    }
}

object juegoViborita {
    var puntaje = 0
    const manzanas = []

    method tiempoEntreMovimientos() {
        return (300 - self.nivel() * 20).max(10)
    }

    method nivel() {
        return 1 + puntaje.div(500)
    }

    method resetear() {
        puntaje = 0
        manzanas.forEach { manzana => game.removeVisual(manzana) }
        self.aparecerManzana()
        self.configurarTemporizadores()
    }

    method seAgarroManzana(manzana) {
        puntaje += 500
        self.configurarTemporizadores()
        game.removeVisual(manzana)
        self.aparecerManzana()
    }

    method puntaje() {
        return puntaje
    }

    method configurar() {
        self.configurarControles()
        self.configurarTemporizadores()
        self.ubicarElementosIniciales()
        self.configurarHUD()
    }

    method configurarHUD() {
        game.addVisual(indicadorDePuntaje)
        game.addVisual(indicadorDeNivel)
    }

    method configurarControles() {
        keyboard.right().onPressDo { viborita.direccion(derecha) }
        keyboard.up().onPressDo { viborita.direccion(arriba) }
        keyboard.left().onPressDo { viborita.direccion(izquierda) }
        keyboard.down().onPressDo { viborita.direccion(abajo) }
    }

    method configurarTemporizadores() {
        game.removeTickEvent("movimiento")
        game.onTick(self.tiempoEntreMovimientos(), "movimiento", { viborita.move() })
    }

    method aparecerManzana() {
        const yMinima = 1
        const yMaxima = game.height() - 3
        const xMinima = 1
        const xMaxima = game.width() - 2
        
        const posicionManzana = game.at(
            xMinima.randomUpTo(xMaxima),
            yMinima.randomUpTo(yMaxima)
        )

        const manzana = new Manzana(position=posicionManzana)
        manzanas.add(manzana)
        game.addVisual(manzana)
    }

    method ubicarElementosIniciales() {
        viborita.position(game.center())

        const paredes = new Set()
        const yBordeInferior = 0
        const yBordeSuperior = game.height() - 2
        const xBordeIzquierdo = 0
        const xBordeDerecho = game.width() - 1
        (xBordeIzquierdo..xBordeDerecho).forEach { x =>
            [
                {
                    const unPortal = new Portal(position=new Position(x=x, y=yBordeInferior))
                    const otroPortal = new Portal(position=new Position(x=x, y=yBordeSuperior))
                    unPortal.otroPortal(otroPortal)
                    otroPortal.otroPortal(unPortal)
                    paredes.addAll([unPortal, otroPortal])
                },
                {
                    const unaPared = new Pared(position=new Position(x=x, y=yBordeInferior))
                    const otraPared = new Pared(position=new Position(x=x, y=yBordeSuperior))
                    paredes.addAll([unaPared, otraPared])
                }
            ].anyOne().apply()
            
        }
        (yBordeInferior .. yBordeSuperior).forEach { y =>
            [
                {
                    const unPortal = new Portal(position=new Position(x=xBordeIzquierdo, y=y-1))
                    const otroPortal = new Portal(position=new Position(x=xBordeDerecho, y=y-1))
                    unPortal.otroPortal(otroPortal)
                    otroPortal.otroPortal(unPortal)
                    paredes.addAll([unPortal, otroPortal])
                },
                {
                    const unaPared = new Pared(position=new Position(x=xBordeIzquierdo, y=y-1))
                    const otraPared = new Pared(position=new Position(x=xBordeDerecho, y=y-1))
                    paredes.addAll([unaPared, otraPared])
                }
            ].anyOne().apply()

        }
        paredes.forEach { pared =>
            game.addVisual(pared)
        }
        self.aparecerManzana()
        

        game.addVisual(viborita)
        game.onCollideDo(viborita, { otroObjeto =>
            otroObjeto.chocasteConViborita(viborita)
        })
    }
}
