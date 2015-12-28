package fa7tapiocadelivery

class BairroController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [bairroInstanceList: Bairro.list(params), bairroInstanceTotal: Bairro.count()]
    }

    def create = {
        def bairroInstance = new Bairro()
        bairroInstance.properties = params
        return [bairroInstance: bairroInstance]
    }

    def save = {
        def bairroInstance = new Bairro(params)
        if (bairroInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'bairro.label', default: 'Bairro'), bairroInstance.id])}"
            redirect(action: "show", id: bairroInstance.id)
        }
        else {
            render(view: "create", model: [bairroInstance: bairroInstance])
        }
    }

    def show = {
        def bairroInstance = Bairro.get(params.id)
        if (!bairroInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bairro.label', default: 'Bairro'), params.id])}"
            redirect(action: "list")
        }
        else {
            [bairroInstance: bairroInstance]
        }
    }

    def edit = {
        def bairroInstance = Bairro.get(params.id)
        if (!bairroInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bairro.label', default: 'Bairro'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [bairroInstance: bairroInstance]
        }
    }

    def update = {
        def bairroInstance = Bairro.get(params.id)
        if (bairroInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (bairroInstance.version > version) {
                    
                    bairroInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'bairro.label', default: 'Bairro')] as Object[], "Another user has updated this Bairro while you were editing")
                    render(view: "edit", model: [bairroInstance: bairroInstance])
                    return
                }
            }
            bairroInstance.properties = params
            if (!bairroInstance.hasErrors() && bairroInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'bairro.label', default: 'Bairro'), bairroInstance.id])}"
                redirect(action: "show", id: bairroInstance.id)
            }
            else {
                render(view: "edit", model: [bairroInstance: bairroInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bairro.label', default: 'Bairro'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def bairroInstance = Bairro.get(params.id)
        if (bairroInstance) {
            try {
                bairroInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'bairro.label', default: 'Bairro'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'bairro.label', default: 'Bairro'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bairro.label', default: 'Bairro'), params.id])}"
            redirect(action: "list")
        }
    }
}
