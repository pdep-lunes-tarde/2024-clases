import wollok.game.*
import mainExample.*

object arriba {
  method proximaPosicion(posicion) {
    return posicion.up(1)
  }
}
object derecha {
  method proximaPosicion(posicion) {
    return posicion.right(1)
  }
}
object izquierda {
  method proximaPosicion(posicion) {
    return posicion.left(1)
  }
}
object abajo {
  method proximaPosicion(posicion) {
    return posicion.down(1)
  }
}

object pared {
  method position() {
    return game.at(game.width() / 2 - 1, game.height() - 2)
  }

  method image() {
    return "pared.png"
  }

  method chocasteConSnake(viborita) {
    viborita.perdiste()
  }
}

class SnakeSegment {
  var position
  method position() {
    return position
  }
  method cambiarPosicion(nuevaPosicion) {
    position = nuevaPosicion
  }
  method image() {
    return "viborita_segmento.png"
  }
  method chocasteConSnake() {

  }
}

object snake {
  const segmentos = new List()
  var position = game.center()
  var direccion = arriba

  method cambiarDireccion(nuevaDireccion) {
    direccion = nuevaDireccion
  }

  method empezaEn(posicionInicial) {
    position = posicionInicial
  }

  method position() {
    return position
  }

  method image() {
    return "viborita_segmento.png"
  }

  method comisteManzana() {
    const segmento = new SnakeSegment(position=self.position())
    game.addVisual(segmento)
    segmentos.add(segmento)
  }

  method move() {
    var viejaPosicion = position
    const nuevaPosicion =
      direccion.proximaPosicion(position)

    position = nuevaPosicion

    segmentos.forEach { segmento =>
      const nuevaPosicionDelSegmento = viejaPosicion
      viejaPosicion = segmento.position()
      segmento.cambiarPosicion(nuevaPosicionDelSegmento)
    }
  }

  method perdiste() {
    jueguito.reset()
    segmentos.clear()
    position = game.center()
  }
}

class Manzana {
  const posicion

  method image() {
    return "manzana.png"
  }
  method position() {
    return posicion
  }

  method chocasteConSnake(viborita) {
    viborita.comisteManzana()
    jueguito.seAgarroUnaManzana(self)
  }
}

object scoreboard {
  var puntaje = 0

  method reset() {
    puntaje = 0
  }

  method aumentarPuntaje(puntos) {
    puntaje += puntos
  }

  method position() {
    return game.at(1, game.height() - 1)
  }

  method text() {
    return "Puntaje: " + puntaje.toString()
  }
}