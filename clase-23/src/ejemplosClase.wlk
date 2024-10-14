// object saludador {
//     method saludar(nombre) {
//         return "holis " + nombre
//     }
// }

import ciudad.*
import ave.*

const puebloPaleta = new Ciudad(ubicacion=new Position(x=1, y=1))
const pepita = new Ave(energia=2, ciudad=puebloPaleta)
const ciudadAzafran = new Ciudad(ubicacion=new Position(x=5, y=5))
const ciudadCeleste = new Ciudad(ubicacion=new Position(x=0, y=0))

object tour {
    method realizar(ave) {
        ave.volarA(ciudadAzafran)
        return ave.volarA(ciudadCeleste)
    }
}

object tourArreglado {
    method realizar(ave) {
        const resultado = ave.volarA(ciudadAzafran)
        if(resultado == "OK") {
            return ave.volarA(ciudadCeleste)
        } else {
            return resultado
        }
    }
}

