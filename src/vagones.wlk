class VagonDePasajeros {
	const property largo
	const property ancho
	const property tieneBanios //definimos que no cambia
	var property estaOrdenado = true
	
	method cantidadDePasajeros(){
		const pasajeros = if(3>=ancho){8*largo} else  10*largo
		return if(not estaOrdenado){0.max(pasajeros-15)} else pasajeros // se puede hacer esto en otro method
	}
	method capacidadMaximaDeCarga()= if(tieneBanios){300}else 800
	method pesoMaximo()= 2000+80*self.cantidadDePasajeros()+self.capacidadMaximaDeCarga()
	method esPopular()=self.cantidadDePasajeros()>50
	method puedeTransportar(unValor) = self.capacidadMaximaDeCarga() >= unValor
	method realizarMantenimiento(){estaOrdenado=true}
	method esDePasajeros() = self.cantidadDePasajeros() > 0
}


class VagonDeCarga {
	const property cargaMaximaIdeal
	var property maderaSuelta
	
	method tieneBanios()=false
	method cantidadDePasajeros()=0
	method capacidadMaximaDeCarga()= 0.max(cargaMaximaIdeal-400*maderaSuelta)
	method pesoMaximo() = 1500+self.capacidadMaximaDeCarga()
	method esPopular()=false
	method puedeTransportar(unValor) = self.capacidadMaximaDeCarga() >= unValor
	method realizarMantenimiento(){maderaSuelta=0.max(maderaSuelta-2)}
	method esDePasajeros() = self.cantidadDePasajeros() > 0
}

class VagonesDormitorio{
	const property compartimentos
	var property camasPorCompartimento
	method cantidadDePasajeros()=compartimentos*camasPorCompartimento
	method pesoMaximo()=4000+80*self.cantidadDePasajeros()
	method capacidadMaximaDeCarga()=1200
	method tieneBanios()=true
	method esPopular()=self.cantidadDePasajeros()>50
	method puedeTransportar(unValor) = self.capacidadMaximaDeCarga() >= unValor
	method realizarMantenimiento(){}
	method esDePasajeros() = self.cantidadDePasajeros() > 0
}