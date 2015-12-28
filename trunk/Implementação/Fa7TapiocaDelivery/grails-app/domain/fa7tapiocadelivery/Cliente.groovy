package fa7tapiocadelivery

class Cliente extends Usuario{

   String endereco
   String bairro
   String Cidade
   String estado
   String PontoDeReferencia
   String email
   Integer telefone


    static hasMany = [pedidos : Pedido]

    static constraints = {
     email(email:true)
    }
}
