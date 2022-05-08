import camion.*

object knightRider {
	
	method peso() = 500
	
	method nivelPeligrosidad() = 10
	
	method totalBultos() = 1
	
	method consecuencia() {}
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() = 800
	
	method nivelDePeligrosidad(){
		if (transformadoEnAuto){ return 15} else {return 30}
	}
	method transformar(){
		transformadoEnAuto = not transformadoEnAuto
	}
	
	method totalBultos() = 2
	
	method consecuencia() { self.transformar() }
	
}

object paqueteLadrillos{
	const  pesoDeLadrillo = 2
	var property cantidadDeLadrillos = 0
	
	method peso() = pesoDeLadrillo * cantidadDeLadrillos
	
	method nivelDePeligrosidad() = 2
	
	method totalBultos() { return 
		if (cantidadDeLadrillos <= 100 ) { 1 }
		else if (cantidadDeLadrillos.between(101, 300)) { 2 }
		else { 3 }
	}
	
	method consecuencia() { cantidadDeLadrillos += 12 }

}


object arena {
	var property peso = 0
	
	method nivelDePeligrosidad() = 1
	
	method totalBultos() = 1
	
	method consecuencia() { peso += 20 }
}

object bateriaAntiaerea {
	var property tieneMisil = true 
	
	method peso(){
		return if (tieneMisil){  300} else { 200}
	}
	method nivelDePeligrosidad(){
		return if(tieneMisil){ 100}else { 0}
	}
	
	method totalBultos() {
		return if (tieneMisil){ 2 } else { 1 }
	}
	
	method consecuencia() { return tieneMisil  }
}

object contenedor {
	var property cosasAdentro = []
	
	method peso() { return 100 + cosasAdentro.sum( { c => c.peso() } ) }
		
	method nivelDePeligrosidad(){
		return  if (cosasAdentro.isEmpty()){ 0 }else { 
			cosasAdentro.max( { c => c.nivelDePeligrosidad() } ).nivelDePeligrosidad()}
	}
	
	method cargar(unaCosa)  { cosasAdentro.add(unaCosa) }
	
	method quitar(unaCosa) { cosasAdentro.remove(unaCosa) }
	
	method totalBultos() = 1 + cosasAdentro.sum( {  c => c.totalBultos()} )
	
	method consecuencia() { cosasAdentro.forEach( { c => c.consecuencia()} ) }
}


object residuosRadioactivos {
	var property peso = 0
	
	method nivelDePeligrosidad() = 200
	
	method totalBultos() = 1
	
	method consecuencia() { peso += 15 }
}

object embalajeSeguridad {
	var  property  cosaAdentro 
	
	method peso() {return  cosaAdentro.peso()}
	
	method nivelDePeligrosidad() = cosaAdentro.nivelDePeligrosidad() * 0.5
	
	method totalBultos() = 2
	
	method consecuencia() {}
		
}




