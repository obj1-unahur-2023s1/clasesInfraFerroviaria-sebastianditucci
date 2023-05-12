class VagonDePasajeros {
	var property largo
	var property ancho
	var property tieneBanios
	var property estaOrdenado
	method cantidadPasajeros() {
		var cantPasajeros = 0
		if (ancho <= 3) cantPasajeros = 8 * largo else cantPasajeros = 10 * largo
		if (!estaOrdenado and cantPasajeros >= 15) cantPasajeros -= 15
		return cantPasajeros
	}
	method cantidadMaximaDeCarga() = if (tieneBanios) 300 else 800
	method pesoMaximo() = 2000 + (80 * self.cantidadPasajeros()) + self.cantidadMaximaDeCarga()
	method recibirMantenimiento() { estaOrdenado = true }
}

class VagonDeCarga {
	var property cargaMaximaIdeal
	var property cantMaderasSueltas
	method cantidadMaximaDeCarga() = cargaMaximaIdeal - (400 * cantMaderasSueltas).max(0)
	method cantidadPasajeros() = 0
	method tieneBanios() = false
	method pesoMaximo() = 1500 + self.cantidadMaximaDeCarga()
	method recibirMantenimiento() { cantMaderasSueltas -= 2.max(0) }
}

class VagonDormitorio {
	var property cantCompartimientos
	var property cantCamasPorCompartimiento
	method cantidadPasajeros() = cantCompartimientos * cantCamasPorCompartimiento
	method tieneBanios() = true
	method cantidadMaximaDeCarga() = 1200
	method pesoMaximo() = 4000 + (80 * self.cantidadPasajeros()) + 1200
	method recibirMantenimiento() {}
}