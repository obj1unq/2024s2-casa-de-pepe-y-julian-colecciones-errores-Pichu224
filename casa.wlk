import cosas.* 

object cuentaCorriente {
  var saldo = 0

  method depositar(cantidad) {
	saldo += cantidad
  }

  method extraer(cantidad) {
	saldo -= cantidad
  }
}

object cuentaConGastos {
  var saldo = 0
  var costoOperacion = 20

  method costoOperacion(_costoOperacion) {
	costoOperacion = _costoOperacion
  }

  method depositar(cantidad) {
	saldo += (cantidad - costoOperacion).max(0)
  }

  method extraer(cantidad) {
	saldo -= cantidad
  }
}

object casa {
	var property cuenta = cuentaCorriente
	var property cosas = []

	method comprar(cosa) {
		cosas.add(cosa)
	}

	method cantidadDeCosasCompradas() {
	  return cosas.size()
	}

	method tieneAlgun(categoria) {
	  return cosas.any({cosa => cosa.categoria() == categoria})
	}

	method vieneDeComprar(categoria) {
	  return not cosas.isEmpty() and 
	  			cosas.last().categoria() == categoria
	}

	method esDerrochona() {
	  return  self.gastoTotal() >= 9000
	}
	//
	method gastoTotal() {
	  return cosas.sum({cosa => cosa.precio()})
	}
	//
	method compraMasCara() {
	  cosas.max({cosa => cosa.precio()})
	}

	method comprados(categoria) {
	  return cosas.filter(
		{cosa => cosa.categoria() == categoria})
	}

	method malaEpoca() {
		const categoriaABuscar = comida
	  return cosas.all(
		{cosa => cosa.categoria() == categoriaABuscar})
	}

	method queFaltaComprar(lista) {

	   return lista.filter({cosa => not self.estaComprado(cosa)})
	}
	//
	method estaComprado(cosa) {
	  return cosas.contains(cosa)
	}
	//
	method faltaComida() {
	  return self.cantidadDeComida() < 2
	}
	//
	method cantidadDeComida() {
		const categoriaABuscar = comida
	  return cosas.count(
		{cosa => cosa.categoria() == categoriaABuscar})
	}
	//
	method categoriasCompradas() {
		return cosas.map(
			{cosa => cosa.categoria()}).asSet()
	}
}

