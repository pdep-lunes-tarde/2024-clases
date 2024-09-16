class Alquimista {
    const ventasPorCliente = new Dictionary()

    method vender(pocion, comprador) {
        if(!ventasPorCliente.containsKey(comprador)) {
            ventasPorCliente.put(comprador, [pocion])
        } else {
            const ventasAlCliente =
                ventasPorCliente.get(comprador)
            ventasAlCliente.add(pocion)
        }
    }

    method cantidadDeClientes() {
        return self.clientes().size()
    }

    method esGourmet() {
        return self.pocionesVendidas().all { pocion =>
            pocion.rareza() > 5
        }
    }

    method pocionesVendidas() {
        return ventasPorCliente.values().flatten()
    }

    method clienteFavorito() {
        return self.clientes().max { cliente =>
            self.pocionesVendidasA(cliente)
        }
    }

    method clientes() {
        return ventasPorCliente.keys()
    }

    method pocionesVendidasA(cliente) {
        return ventasPorCliente.get(cliente).size()
    }
}