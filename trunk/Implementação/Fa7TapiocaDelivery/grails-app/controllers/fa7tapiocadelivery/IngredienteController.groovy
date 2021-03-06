package fa7tapiocadelivery

class IngredienteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {

        if(session.user){
            redirect(action: "list", params: params)
        }else{
            flash.message = "É necessario logar"
            redirect(url:"/Fa7TapiocaDelivery")
        }
        
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 3, 100)
        [ingredienteInstanceList: Ingrediente.list(params), ingredienteInstanceTotal: Ingrediente.count()]
    }

    def create = {
        def ingredienteInstance = new Ingrediente()
		
		ingredienteInstance.properties = params
        return [ingredienteInstance: ingredienteInstance]
    }

    def save = {
        def ingredienteInstance = new Ingrediente(params)
        if (ingredienteInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'ingrediente.label', default: 'Ingrediente'), ingredienteInstance.id])}"
            redirect(action: "show", id: ingredienteInstance.id)
        }
        else {
            render(view: "create", model: [ingredienteInstance: ingredienteInstance])
        }
    }

    def show = {
        def ingredienteInstance = Ingrediente.get(params.id)
        if (!ingredienteInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ingrediente.label', default: 'Ingrediente'), params.id])}"
            redirect(action: "list")
        }
        else {
            [ingredienteInstance: ingredienteInstance]
        }
    }

    def edit = {
        def ingredienteInstance = Ingrediente.get(params.id)
        if (!ingredienteInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ingrediente.label', default: 'Ingrediente'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [ingredienteInstance: ingredienteInstance]
        }
    }

    def update = {
        def ingredienteInstance = Ingrediente.get(params.id)
        if (ingredienteInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (ingredienteInstance.version > version) {
                    
                    ingredienteInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'ingrediente.label', default: 'Ingrediente')] as Object[], "Another user has updated this Ingrediente while you were editing")
                    render(view: "edit", model: [ingredienteInstance: ingredienteInstance])
                    return
                }
            }
            ingredienteInstance.properties = params
            if (!ingredienteInstance.hasErrors() && ingredienteInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'ingrediente.label', default: 'Ingrediente'), ingredienteInstance.id])}"
                redirect(action: "show", id: ingredienteInstance.id)
            }
            else {
                render(view: "edit", model: [ingredienteInstance: ingredienteInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ingrediente.label', default: 'Ingrediente'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def ingredienteInstance = Ingrediente.get(params.id)
        if (ingredienteInstance) {
            try {
                ingredienteInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'ingrediente.label', default: 'Ingrediente'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'ingrediente.label', default: 'Ingrediente'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ingrediente.label', default: 'Ingrediente'), params.id])}"
            redirect(action: "list")
        }
    }
}
