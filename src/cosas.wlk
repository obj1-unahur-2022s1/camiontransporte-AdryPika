object knightRider {
	
	method peso() = 500
	
	method nivelPeligrosidad() = 10
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() = 800
	
	method nivelDePeligrosidad(){
		if (transformadoEnAuto){ return 15} else {return 30}
	}
	method trasformar(){
		transformadoEnAuto = not transformadoEnAuto
	}
	
}

object paqueteLadrillos{
	const property pesoDeLadrillo = 2
	var property cantidadDeLadrillos 
	
	method peso() = pesoDeLadrillo * cantidadDeLadrillos
	
	method nivelDePeligrosidad() = 2

}


object arena {
	var property peso = 0
	
	method nivelDePeligrosidad() = 1
}

object bateriaAntiarea {
	var property tieneMisil = true 
	
	method peso(){
		if (tieneMisil){ return 300} else {return 200}
	}
	method nivelDePeligrosidad(){
		if(tieneMisil){return 100}else {return 0}
	}
}

object contenedor {
	var property cosasAdentro = []
	
	method peso(){
		return 100 + cosasAdentro.sum( { c => c.peso() } )
	}
	method nivelDePeligrosidad(){
		 if (cosasAdentro.isEmpty()){
		 	return 0
		 }else { return cosasAdentro.max( { c => c.nivelDePeligrosidad() } ).nivelDePeligrosidad() }
	}
}


object residuosRadioactivos {
	var property peso = 0
	
	method nivelDePeligrosidad() = 200
}

object embalajeSeguridad {
	var property cosaAdentro 
	
	method peso() = cosaAdentro.peso()
	
	method nivelDePeligrosidad() = cosaAdentro.nivelDePeligrosidad() * 0.5

}




