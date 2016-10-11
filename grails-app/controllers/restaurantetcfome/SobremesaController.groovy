package restaurantetcfome



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SobremesaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Sobremesa.list(params), model:[sobremesaInstanceCount: Sobremesa.count()]
    }

    def show(Sobremesa sobremesaInstance) {
        respond sobremesaInstance
    }

    def create() {
        respond new Sobremesa(params)
    }

    @Transactional
    def save(Sobremesa sobremesaInstance) {
        if (sobremesaInstance == null) {
            notFound()
            return
        }

        if (sobremesaInstance.hasErrors()) {
            respond sobremesaInstance.errors, view:'create'
            return
        }

        sobremesaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'sobremesa.label', default: 'Sobremesa'), sobremesaInstance.id])
                redirect sobremesaInstance
            }
            '*' { respond sobremesaInstance, [status: CREATED] }
        }
    }

    def edit(Sobremesa sobremesaInstance) {
        respond sobremesaInstance
    }

    @Transactional
    def update(Sobremesa sobremesaInstance) {
        if (sobremesaInstance == null) {
            notFound()
            return
        }

        if (sobremesaInstance.hasErrors()) {
            respond sobremesaInstance.errors, view:'edit'
            return
        }

        sobremesaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Sobremesa.label', default: 'Sobremesa'), sobremesaInstance.id])
                redirect sobremesaInstance
            }
            '*'{ respond sobremesaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Sobremesa sobremesaInstance) {

        if (sobremesaInstance == null) {
            notFound()
            return
        }

        sobremesaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Sobremesa.label', default: 'Sobremesa'), sobremesaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'sobremesa.label', default: 'Sobremesa'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
