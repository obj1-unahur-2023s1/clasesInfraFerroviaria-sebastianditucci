class Deposito {
	const formaciones = #{}
	const locomotoras = #{}
	method vagonesMasPesados() = formaciones.filter({formacion => formacion.vagones().max({vagon => vagon.pesoMaximo()})})
	method necesitaUnConductorExperimentado() = formaciones.all({formacion => formacion.esCompleja()})
	// no supe como hacer el ultimo metodo agregarLocomotoraAFormacion(locomotora, formacion)
}
