import formacion.*
import vagones.*
import locomotoras.*

class Deposito {
	const formaciones = #{}
	const locomotoras = #{}
	method vagonesMasPesados() = formaciones.filter({formacion => formacion.vagones().max({vagon => vagon.pesoMaximo()})})
	method necesitaUnConductorExperimentado() = formaciones.all({formacion => formacion.esCompleja()})
	method agregarLocomotoraAFormacion(formacion) {
		if (!formacion.puedeMoverse()) { formacion.aniadirLocomotora(locomotoras.find({locomotora => locomotora.cuantoPuedeArrastrar() >= formacion.kilosDeEmpujeParaPoderMoverse()})) }
		
	}
}
