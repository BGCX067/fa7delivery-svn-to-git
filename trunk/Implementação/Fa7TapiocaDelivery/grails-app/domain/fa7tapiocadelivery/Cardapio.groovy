package fa7tapiocadelivery

class Cardapio {

    String nome
    String tipo
    Integer porcao
    

    static hasMany = [ingredientes : Ingrediente]

    static constraints = {
        nome(blank:false)
        ingredientes(nullable:false)
    }

    public String toString(){
        return getNome()
    }
}
