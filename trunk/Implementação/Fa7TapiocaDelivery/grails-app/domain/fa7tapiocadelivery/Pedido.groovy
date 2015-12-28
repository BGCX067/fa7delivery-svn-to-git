package fa7tapiocadelivery

class Pedido {

    String descricao
 //   Usuario usuario
    Double valor
    //ArrayList<Tapioca> itens
    String status
    //StatusPedido status
    Integer quantidade
    String dataPedido

    static hasMany = [cardapios:Cardapio]

    static belongsTo = [cliente:Cliente]


    static constraints = {
        status(blank:false, inList:["S", "E", "T", "F", "C"])
        valor(nullable:false)
        dataPedido(blank:false)
        cardapios(nullable:false)
    }

    
}
