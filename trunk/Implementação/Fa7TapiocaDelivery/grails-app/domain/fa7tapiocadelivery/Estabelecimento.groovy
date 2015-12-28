package fa7tapiocadelivery

class Estabelecimento {
    String descricao
    String endereco
    String cnpj
    String fone
    String responsavel

    static hasMany = [bairros:Bairro]

    static constraints = {
           descricao(blank: false)
           endereco(blank: false)
           cnpj(blank: false)
           fone(blank: false)
           responsavel(blank: false)
    }
}
