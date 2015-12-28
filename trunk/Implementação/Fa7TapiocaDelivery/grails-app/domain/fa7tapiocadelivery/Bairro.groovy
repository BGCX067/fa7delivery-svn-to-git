package fa7tapiocadelivery

class Bairro {
    String descricao

    static belongsTo = [estabelecimento:Estabelecimento]

    static constraints = {
           descricao(blank: false)
    }
}
