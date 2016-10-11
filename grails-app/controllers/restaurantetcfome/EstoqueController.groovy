package restaurantetcfome



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EstoqueController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Estoque.list(params), model:[estoqueInstanceCount: Estoque.count()]
    }

    def show(Estoque estoqueInstance) {
        respond estoqueInstance
    }

    def create() {
        respond new Estoque(params)
    }

    @Transactional
    def save(Estoque estoqueInstance) {
        if (estoqueInstance == null) {
            notFound()
            return
        }

        if (estoqueInstance.hasErrors()) {
            respond estoqueInstance.errors, view:'create'
            return
        }

        estoqueInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'estoque.label', default: 'Estoque'), estoqueInstance.id])
                redirect estoqueInstance
            }
            '*' { respond estoqueInstance, [status: CREATED] }
        }
    }

    def edit(Estoque estoqueInstance) {
        respond estoqueInstance
    }

    @Transactional
    def update(Estoque estoqueInstance) {
        if (estoqueInstance == null) {
            notFound()
            return
        }

        if (estoqueInstance.hasErrors()) {
            respond estoqueInstance.errors, view:'edit'
            return
        }

        estoqueInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Estoque.label', default: 'Estoque'), estoqueInstance.id])
                redirect estoqueInstance
            }
            '*'{ respond estoqueInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Estoque estoqueInstance) {

        if (estoqueInstance == null) {
            notFound()
            return
        }

        estoqueInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Estoque.label', default: 'Estoque'), estoqueInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'estoque.label', default: 'Estoque'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
