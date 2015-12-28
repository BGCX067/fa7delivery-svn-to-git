package fa7tapiocadelivery

class Ingrediente {

    String nome
    String tipo
    String porcao
    Integer qtdeCalorias
    Double preco

    static constraints = {
        nome(blank:false)
        porcao(blank:false)
        tipo(blank:false)
    }

     public String toString(){
		String nomePreco = this.getNome() + " - " + this.getPreco()
		return nomePreco
		
    }
}
