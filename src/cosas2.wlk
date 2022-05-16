/*
 * cosas2: Bien! Solo había un detalle sobre un método de bumblee, el resto solo sugerencias 
 */
import camion.* // No es necesario importar los objetos del archivo camion

object knightRider {
	/* Bien! */
	method peso() = 500
	
	method nivelPeligrosidad() = 10
	
	method totalBultos() = 1
	
	method consecuencia() {}
}

object bumblebee {
	/* Bien(-). El método consecuencia() debería setear en false el valor de la variable
	 * transformadoEnAuto. De la forma que está hecho, si bumblebee estuviese ya como robot
	 * al cargarlo en el cambión se transformaría en auto y eso no sería correcto. Te dejo
	 * escrita la corrección.
	 */
	var transformadoEnAuto = true
	
	method peso() = 800
	
	method nivelDePeligrosidad(){
		if (transformadoEnAuto){ return 15} else {return 30}
	}
	method transformar(){
		transformadoEnAuto = not transformadoEnAuto
	}
	
	method totalBultos() = 2
	
	method consecuencia() { transformadoEnAuto = false }
	
}

object paqueteLadrillos{
	/* Bien. Es buena idea usar una constante para pesoDeLadrillo, si se usara en varios
	 * métodos a lo largo del código, pero en este caso como solo se utiliza para el cálculo
	 * del peso no haría falta, de cualquier forma es correcta la solución.
	 */
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
	/* Bien! */
	var property peso = 0
	
	method nivelDePeligrosidad() = 1
	
	method totalBultos() = 1
	
	method consecuencia() { peso += 20 }
}

object bateriaAntiaerea {
	/* Bien(-). Acá también te dejo las formas resumidas sin usar return. El método consecuencia()
	 * no está correcto, ya que retorna el valor de la variable tieneMisil, y lo que pedía el
	 * enunciado es que al cargar la bateria en el camión, lo hiciera con los misiles. Te dejo
	 * la corrección del código.
	 */
	var property tieneMisil = true 
	
	method peso() = if(tieneMisil) 300 else 200
	
	method nivelDePeligrosidad() = if(tieneMisil) 100 else 0
	
	method totalBultos() = if(tieneMisil) {2} else {1}
	
	method consecuencia() { self.tieneMisil(true) /* usando el setter */ } // o también: { tieneMisil = true }
}

object contenedor {
	/* Bien. Te dejé unas sugerencias */
	var property cosasAdentro = []
	
	method peso() { return 100 + cosasAdentro.sum( { c => c.peso() } ) }
		
	method nivelDePeligrosidad(){
		/* Bien, pero quedaba mejor si definías un método auxiliar que te retornara
		 * el objeto contenido más peligroso y luego a ese pedirle el nivelDePeligrosidad()
		 * Te dejo la sugerencia en el código
		 */
		return  if (cosasAdentro.isEmpty()){ 0 }else { 
			self.objetoContenidoMasPeligroso().nivelDePeligrosidad()}
	}
	method objetoContenidoMasPeligroso() = cosasAdentro.max({c=>c.nivelDePeligrosidad()})
	
	method cargar(unaCosa)  { cosasAdentro.add(unaCosa) }
	
	method quitar(unaCosa) { cosasAdentro.remove(unaCosa) }
	
	method totalBultos() = 1 + cosasAdentro.sum( {  c => c.totalBultos()} )
	
	method consecuencia() { cosasAdentro.forEach( { c => c.consecuencia()} ) }
}


object residuosRadioactivos {
	/* Bien! */
	var property peso = 0
	
	method nivelDePeligrosidad() = 200
	
	method totalBultos() = 1
	
	method consecuencia() { peso += 15 }
}

object embalajeSeguridad {
	/* Bien! */
	var  property  cosaAdentro 
	
	method peso() {return  cosaAdentro.peso()}
	
	method nivelDePeligrosidad() = cosaAdentro.nivelDePeligrosidad() * 0.5
	
	method totalBultos() = 2
	
	method consecuencia() {}
		
}




