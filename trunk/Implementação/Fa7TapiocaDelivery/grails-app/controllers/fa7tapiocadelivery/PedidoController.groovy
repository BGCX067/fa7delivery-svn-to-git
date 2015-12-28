package fa7tapiocadelivery

class PedidoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {

        if(session.user){
            redirect(action: "listSol", params: params)
        }else{
            flash.message = "É necessário logar"
            redirect(url:"/Fa7TapiocaDelivery")
        }
        
    }

    def listSol = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        //[pedidoInstanceList: Pedido.list(params), pedidoInstanceTotal: Pedido.count()]
        [pedidoInstanceList: Pedido.findByStatus("S"), pedidoInstanceTotal: Pedido.count()]
    }

    def listExe = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [pedidoInstanceList: Pedido.findByStatus("E"), pedidoInstanceTotal: Pedido.count()]
    }

     def listTra = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [pedidoInstanceList: Pedido.findByStatus("T"), pedidoInstanceTotal: Pedido.count()]
    }

     def listFin = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [pedidoInstanceList: Pedido.findByStatus("F"), pedidoInstanceTotal: Pedido.count()]
    }

     def listCan = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [pedidoInstanceList: Pedido.findByStatus("C"), pedidoInstanceTotal: Pedido.count()]
    }


    def create = {
        def pedidoInstance = new Pedido()
        pedidoInstance.properties = params
        return [pedidoInstance: pedidoInstance]
    }

    def save = {
        def pedidoInstance = new Pedido(params)
        if (pedidoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'pedido.label', default: 'Pedido'), pedidoInstance.id])}"
            redirect(action: "show", id: pedidoInstance.id)
        }
        else {
            render(view: "create", model: [pedidoInstance: pedidoInstance])
        }
    }

    def show = {
        def pedidoInstance = Pedido.get(params.id)
        if (!pedidoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pedido.label', default: 'Pedido'), params.id])}"
            redirect(action: "listSol")
        }
        else {
            [pedidoInstance: pedidoInstance]
        }
    }

    def edit = {
        def pedidoInstance = Pedido.get(params.id)
        if (!pedidoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pedido.label', default: 'Pedido'), params.id])}"
            redirect(action: "listSol")
        }
        else {
            return [pedidoInstance: pedidoInstance]
        }
    }

    def update = {
        def pedidoInstance = Pedido.get(params.id)
        if (pedidoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (pedidoInstance.version > version) {
                    
                    pedidoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'pedido.label', default: 'Pedido')] as Object[], "Another user has updated this Pedido while you were editing")
                    render(view: "edit", model: [pedidoInstance: pedidoInstance])
                    return
                }
            }
            pedidoInstance.properties = params
            if (!pedidoInstance.hasErrors() && pedidoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'pedido.label', default: 'Pedido'), pedidoInstance.id])}"
                redirect(action: "listSol", id: pedidoInstance.id)
            }
            else {
                render(view: "edit", model: [pedidoInstance: pedidoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pedido.label', default: 'Pedido'), params.id])}"
            redirect(action: "listSol")
        }
    }

    def delete = {
        def pedidoInstance = Pedido.get(params.id)
        if (pedidoInstance) {
            try {
                pedidoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'pedido.label', default: 'Pedido'), params.id])}"
                redirect(action: "listSol")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'pedido.label', default: 'Pedido'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pedido.label', default: 'Pedido'), params.id])}"
            redirect(action: "listSol")
        }
    }
    
    def consultarstatus = {
		
		if (params){
			[ pedido: Pedido.get(params.id)]
			//if pedido == null 
			//pedido.set( mostrarStatus = true )
			//pedido.params.mostrarStatus = true
		}
		else{
			//pedido.set( mostrarStatus = false )
			//pedido.params.mostrarStatus = false
		}
	}
	
	
    def preparestatus = { 
	    
		def pedidoInstance = new Pedido()
		pedidoInstance.properties = params
		[pedidoInstance: pedidoInstance]
		render(view: "consultarstatus", model: [pedidoInstance: pedidoInstance])
    }
}
