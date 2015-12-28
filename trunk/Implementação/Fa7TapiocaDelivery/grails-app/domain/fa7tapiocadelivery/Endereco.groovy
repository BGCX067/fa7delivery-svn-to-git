package fa7tapiocadelivery

class Endereco {


    String rua
    Integer numero
    String complemento
    String Bairro
    String Cidade
    String Estado
    Integer CEP
    String PontoDeReferenica



    static constraints = {
    
         rua(nulllable:false,blank:false,maxSize:225)
         numero(nulllable:false,blank:false,maxSize:225)
         Bairro(nulllable:false,blank:false,maxSize:225)
         CEP(nulllable:false,blank:false,maxSize:225)

    }
}
