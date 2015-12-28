package fa7tapiocadelivery

class MontarTapioca {
	String nome
    String preco
	static hasMany = [ingredientes : Ingrediente]
    
	static constraints = {
        nome(blank:false)
		preco(blank:false)
        ingredientes(blank:false)
	}
}
