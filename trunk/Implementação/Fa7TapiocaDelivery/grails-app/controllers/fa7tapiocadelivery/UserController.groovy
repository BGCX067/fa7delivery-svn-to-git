package fa7tapiocadelivery

class UserController {
    def index = { }
    
    def login = {
        def user = Usuario.findByCpfAndSenha(params.username, params.password)
        if ( !user ) {
            user = Funcionario.findByCpfAndSenha(params.username, params.password)
        }
        if(user){
          session.user = user
          //flash.message = "Hello ${user.nome}!"
          flash.message = "Ok ${user.nome}, você está logado."
          redirect(action:"index")
        } else {
          flash.message = "Por favor, tente outra vez."
          //redirect(action:"error")
        }
        
    }
    
    def logout = {
        session.user = null
        redirect(action: "index")
    }
}
