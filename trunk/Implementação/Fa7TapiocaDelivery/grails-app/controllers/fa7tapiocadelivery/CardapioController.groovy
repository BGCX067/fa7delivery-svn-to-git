package fa7tapiocadelivery

class CardapioController {

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
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [cardapioInstanceList: Cardapio.list(params), cardapioInstanceTotal: Cardapio.count()]
    }

    def create = {
            def cardapioInstance = new Cardapio()
            cardapioInstance.properties = params
            return [cardapioInstance: cardapioInstance]
    }

    def save = {
        def cardapioInstance = new Cardapio(params)
        if (cardapioInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'cardapio.label', default: 'Cardapio'), cardapioInstance.id])}"
            redirect(action: "show", id: cardapioInstance.id)
        }
        else {
            render(view: "create", model: [cardapioInstance: cardapioInstance])
        }
    }

    def show = {
        def cardapioInstance = Cardapio.get(params.id)
        if (!cardapioInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'cardapio.label', default: 'Cardapio'), params.id])}"
            redirect(action: "list")
        }
        else {
            [cardapioInstance: cardapioInstance]
        }
    }

    def edit = {
        def cardapioInstance = Cardapio.get(params.id)
        if (!cardapioInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'cardapio.label', default: 'Cardapio'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [cardapioInstance: cardapioInstance]
        }
    }

    def update = {
        def cardapioInstance = Cardapio.get(params.id)
        if (cardapioInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (cardapioInstance.version > version) {
                    
                    cardapioInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'cardapio.label', default: 'Cardapio')] as Object[], "Another user has updated this Cardapio while you were editing")
                    render(view: "edit", model: [cardapioInstance: cardapioInstance])
                    return
                }
            }
            cardapioInstance.properties = params
            if (!cardapioInstance.hasErrors() && cardapioInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'cardapio.label', default: 'Cardapio'), cardapioInstance.id])}"
                redirect(action: "show", id: cardapioInstance.id)
            }
            else {
                render(view: "edit", model: [cardapioInstance: cardapioInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'cardapio.label', default: 'Cardapio'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def cardapioInstance = Cardapio.get(params.id)
        if (cardapioInstance) {
            try {
                cardapioInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'cardapio.label', default: 'Cardapio'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'cardapio.label', default: 'Cardapio'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'cardapio.label', default: 'Cardapio'), params.id])}"
            redirect(action: "list")
        }
    }
}
