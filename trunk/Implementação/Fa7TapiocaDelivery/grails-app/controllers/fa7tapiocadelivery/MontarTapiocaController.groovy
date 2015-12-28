package fa7tapiocadelivery

class MontarTapiocaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [montarTapiocaInstanceList: MontarTapioca.list(params), montarTapiocaInstanceTotal: MontarTapioca.count()]
    }

    def create = {
        def montarTapiocaInstance = new MontarTapioca()
        montarTapiocaInstance.properties = params
        return [montarTapiocaInstance: montarTapiocaInstance]
    }

    def save = {
        def montarTapiocaInstance = new MontarTapioca(params)
        if (montarTapiocaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'montarTapioca.label', default: 'MontarTapioca'), montarTapiocaInstance.id])}"
            redirect(action: "show", id: montarTapiocaInstance.id)
        }
        else {
            render(view: "create", model: [montarTapiocaInstance: montarTapiocaInstance])
        }
    }

    def show = {
        def montarTapiocaInstance = MontarTapioca.get(params.id)
        if (!montarTapiocaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'montarTapioca.label', default: 'MontarTapioca'), params.id])}"
            redirect(action: "list")
        }
        else {
            [montarTapiocaInstance: montarTapiocaInstance]
        }
    }

    def edit = {
        def montarTapiocaInstance = MontarTapioca.get(params.id)
        if (!montarTapiocaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'montarTapioca.label', default: 'MontarTapioca'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [montarTapiocaInstance: montarTapiocaInstance]
        }
    }

    def update = {
        def montarTapiocaInstance = MontarTapioca.get(params.id)
        if (montarTapiocaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (montarTapiocaInstance.version > version) {
                    
                    montarTapiocaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'montarTapioca.label', default: 'MontarTapioca')] as Object[], "Another user has updated this MontarTapioca while you were editing")
                    render(view: "edit", model: [montarTapiocaInstance: montarTapiocaInstance])
                    return
                }
            }
            montarTapiocaInstance.properties = params
            if (!montarTapiocaInstance.hasErrors() && montarTapiocaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'montarTapioca.label', default: 'MontarTapioca'), montarTapiocaInstance.id])}"
                redirect(action: "show", id: montarTapiocaInstance.id)
            }
            else {
                render(view: "edit", model: [montarTapiocaInstance: montarTapiocaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'montarTapioca.label', default: 'MontarTapioca'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def montarTapiocaInstance = MontarTapioca.get(params.id)
        if (montarTapiocaInstance) {
            try {
                montarTapiocaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'montarTapioca.label', default: 'MontarTapioca'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'montarTapioca.label', default: 'MontarTapioca'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'montarTapioca.label', default: 'MontarTapioca'), params.id])}"
            redirect(action: "list")
        }
    }
}
