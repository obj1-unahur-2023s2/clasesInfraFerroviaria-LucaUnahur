
import vagones.*
import locomotoras.*
class Formacion {
	const vagones=[]
	const locomotoras=[]
	
	method agregarLocomotora(locomotora){
		locomotoras.add(locomotora)
	}
	
	method quitarLocomotora(locomotora){
		locomotoras.remove(locomotora)
	}
	
	
	method agregarVagon(vagon){
		vagones.add(vagon)
	}
	
	method quitarVagon(vagon){
		vagones.remove(vagon)
	}
	
	method capacidadDePasajerosTotal() = vagones.sum( { vagon => vagon.cantidadDePasajeros()})
	method cantidadDeVagonesPopulares()= vagones.count{vagon=>vagon.esPopular()}
	method esFormacionCarguera()= vagones.all({vagon => vagon.puedeTransportar(1000)})
	//inicioMetodosAuxiliares
	method vagonMasPesado()= vagones.max({vagon=>vagon.pesoMaximo()})
	method vagonMasLiviano()= vagones.min({vagon=>vagon.pesoMaximo()})
	method vagonesDePasajeros()= vagones.filter({vagon=>vagon.esDePasajeros()})
	//finMetodosAuxiliares
	method dispersionDePesos() = self.vagonMasPesado().pesoMaximo() - self.vagonMasLiviano().pesoMaximo()
	method dispersionDePesoss() {
		const maximo = vagones.max { vagon => vagon.pesoMaximo() }
		const minimo = vagones.min { vagon => vagon.pesoMaximo() }
		return maximo.pesoMaximo() - minimo.pesoMaximo()
	}
	method cantidadDebanios()= vagones.count{vagon=>vagon.tieneBanios()}
	method realizarMantenimientoDeFormacion(){
		vagones.forEach({vagon=>vagon.realizarMantenimiento()})
	}
	method estaEquilibrada(){
		const pasajeros = self.vagonesDePasajeros()
		const maximo = pasajeros.max({vagon=>vagon.cantidadDePasajeros()})//devuelve el vagon con mas pasajeros
		const minimo = pasajeros.min({vagon=>vagon.cantidadDePasajeros()})//devuelve el vagon con menos pasajeros
		return maximo.cantidadDePasajeros()-minimo.cantidadDePasajeros()<=20
	}
	
method estaOrganizada() {
		return not (1..vagones.size()-1).any {
			idx => not vagones.get(idx-1).esDePasajeros() and vagones.get(idx).esDePasajeros()
		}
	}
//methods de locomotora
//metodos auxiliares
method locomotoraMasLenta()=locomotoras.min({locomotora=>locomotora.velocidadMaxima()})
method pesoDeLocomotoras()= locomotoras.sum({locomotora=>locomotora.peso()})
method pesoDeVagones()= vagones.sum({vagon=>vagon.pesoMaximo()})
method sumaDelArrastre()= locomotoras.sum({locomotora=>locomotora.pesoDeArrastre()})
method sumaDePesos()= self.pesoDeLocomotoras()+self.pesoDeVagones()
method esCompleja() {return
		self.unidadesDeLaFormacion() > 8 or self.sumaDePesos() > 80000
	}
method unidadesDeLaFormacion() {return
		vagones.size() + locomotoras.size()
	}
method kilosDeEmpujeFaltante() {
		return 0.max(self.sumaDePesos() - self.sumaDelArrastre())
	}
//fin de metodos auxiliares

method velocidadMaxima()= self.locomotoraMasLenta().velocidadMaxima()
method esEficiente()=locomotoras.all({locomotora=>locomotora.esEficiente()})
method puedeMoverse()=self.sumaDelArrastre()>=self.sumaDePesos()
method kilosDeEmpujeFaltantes()=0.max(self.sumaDePesos()-self.sumaDelArrastre())
}















