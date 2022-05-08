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
	method transformar(){
		transformadoEnAuto = not transformadoEnAuto
	}
	
}

object paqueteLadrillos{
	const  pesoDeLadrillo = 2
	var property cantidadDeLadrillos = 0
	
	method peso() = pesoDeLadrillo * cantidadDeLadrillos
	
	method nivelDePeligrosidad() = 2

}


object arena {
	var property peso = 0
	
	method nivelDePeligrosidad() = 1
}

object bateriaAntiaerea {
	var property tieneMisil = true 
	
	method peso(){
		return if (tieneMisil){  300} else { 200}
	}
	method nivelDePeligrosidad(){
		return if(tieneMisil){ 100}else { 0}
	}
}

object contenedor {
	var property cosasAdentro = []
	
	method peso(){
		return 100 + cosasAdentro.sum( { c => c.peso() } )
	}
	method nivelDePeligrosidad(){
		return  if (cosasAdentro.isEmpty()){
		 	 0
		 }else {  cosasAdentro.max( { c => c.nivelDePeligrosidad() } ).nivelDePeligrosidad() }
	}
	
}


object residuosRadioactivos {
	var property peso = 0
	
	method nivelDePeligrosidad() = 200
}

object embalajeSeguridad {
	var  property  cosaAdentro  = algunObjeto 
	
	method peso() = cosaAdentro.peso()
	
	method nivelDePeligrosidad() = cosaAdentro.nivelDePeligrosidad() * 0.5
		
}

object  algunObjeto{
	var property peso = 0
	var property nivelDePeligrosidad = 0
}





