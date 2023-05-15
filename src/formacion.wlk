import vagones.*
import locomotoras.*

class Formacion {
	const locomotoras = []
	const vagones = []
	method vagones() = vagones
	method locomotoras() = locomotoras
	method aniadirLocomotora(locomotora) { locomotoras.add(locomotora) }
	method sacarLocomotora(locomotora) { locomotoras.remove(locomotora) }
	method aniadirVagon(vagon) { vagones.add(vagon) }
	method sacarVagon(vagon) { vagones.remove(vagon) }
	method cantidadMaximaDePasajeros() = vagones.sum({vagon => vagon.cantidadPasajeros()})
	method cantidadVagonesPopulares() = vagones.filter({vagon => vagon.cantidadPasajeros() > 50}).size()
	method esUnaFormacionCarguera() = vagones.all({vagon => vagon.cantidadMaximaDeCarga() >= 1000})
	method dispersionDePesos() {
		return vagones.max({vagon => vagon.pesoMaximo()}).pesoMaximo() - vagones.min({vagon => vagon.pesoMaximo()}).pesoMaximo()
	}
	method cantidadBanios() = vagones.count({vagon => vagon.tieneBanios()})
	method hacerMantenimiento() = vagones.forEach({vagon => vagon.recibirMantenimiento()})
	method estaEquilibrada() {
		return (vagones.max({vagon => vagon.cantidadPasajeros()}).cantidadDePasajeros() - vagones.min({vagon => vagon.cantidadPasajeros()}).cantidadDePasajeros()) < 20
    }
    method estaOrdenada() { } //nose como hacerlo 
    method velocidadMaxima() = locomotoras.min({locomotora => locomotora.velocidadMaxima()}).velocidadMaxima()
    method esEficiente() = locomotoras.all({locomotora => locomotora.esEficiente()})
    method pesoMaximo() = locomotoras.sum({locomotora => locomotora.peso()}) + vagones.sum({vagon => vagon.pesoMaximo()})
    method puedeMoverse() = locomotoras.sum({locomotora => locomotora.cuantoPuedeArrastrar()}) >= self.pesoMaximo()
    method kilosDeEmpujeParaPoderMoverse() {
    	if (self.puedeMoverse()) { return 0 }
    	else { return  self.pesoMaximo() - locomotoras.sum({locomotora => locomotora.cuantoPuedeArrastrar()})}
    }
    method esCompleja() = (locomotoras.size() + vagones.size()) > 8 or self.pesoMaximo() > 80000
}