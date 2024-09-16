class Direccion {
    method esOpuestaDe(otra) {
        return otra == self.opuesta()
    }
}

object arriba inherits Direccion {
    method proximaPosicion(posicion) {
        return posicion.up(1)
    }
    method opuesta() {
        return abajo
    }
}
object derecha inherits Direccion {
    method proximaPosicion(posicion) {
        return posicion.right(1)
    }
    method opuesta() {
        return izquierda
    }
}
object izquierda inherits Direccion {
    method proximaPosicion(posicion) {
        return posicion.left(1)
    }
    method opuesta() {
        return derecha
    }
}
object abajo inherits Direccion {
    method proximaPosicion(posicion) {
        return posicion.down(1)
    }
    method opuesta() {
        return arriba
    }
}