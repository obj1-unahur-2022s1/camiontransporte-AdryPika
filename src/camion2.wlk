/*
 * camion2: Bien!
 */
import cosas2.*

object camion {
	var property cosas = []
	const property tara = 1000
	
	method cargar(cosa){
		cosas.add(cosa)	
		cosa.consecuencia()
	}
	
	method descargar(cosa){ cosas.remove(cosa) }
	
	method todoPesoPar(){ 
		return cosas.all( { c => c.peso().even() } )
	}
	
	method hayAlgunoQuePesa(peso){
		return cosas.any(  {  c => c.peso() == peso })
	}
	
	method elDeNivel(nivel){
		return cosas.find( { c => c.nivelDePeligrosidad() == nivel } )
	}
	
	method pesoTotal(){
		return cosas.sum( { c => c.peso() } ) + tara
	}
	
	method excedidoDePeso(){
		return  self.pesoTotal() > 2500
	}
	
	method objetosQueSuperanPeligrosidad(nivel){
		return cosas.filter( { c => c.nivelDePeligrosidad() > nivel } )
	}
	
	method objetosMasPeligrososQue(cosa){
		return self.objetosQueSuperanPeligrosidad(cosa.nivelDePeligrosidad())
	}
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad){
		return not self.excedidoDePeso() &&
		self.objetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad).isEmpty()
	}
	
	
	method tieneAlgoQuePesaEntre(min, max){
		return cosas.any( { c => c.peso().between(min, max) } )
	}
	
	method cosaMasPesada() {
		return cosas.max( { c => c.peso() } )
	}
	
	method pesos(){
		return cosas.map( { c => c.peso() } )
	}

}

