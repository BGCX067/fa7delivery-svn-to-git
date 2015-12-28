package fa7tapiocadelivery

class Usuario {

    String nome
    String cpf
    int senha
   




    static constraints = {
        cpf(nullable: false, blank:false, maxSize:11, unique:true)
        nome(nulllable:false,blank:false,maxSize:225)
        senha(nullable:false)
    }


}
