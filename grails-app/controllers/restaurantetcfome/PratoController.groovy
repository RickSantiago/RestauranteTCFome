package restaurantetcfome



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PratoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Prato.list(params), model:[pratoInstanceCount: Prato.count()]
    }

    def show(Prato pratoInstance) {
        respond pratoInstance
    }

    def create() {
        respond new Prato(params)
    }

    @Transactional
    def save(Prato pratoInstance) {
        if (pratoInstance == null) {
            notFound()
            return
        }

        if (pratoInstance.hasErrors()) {
            respond pratoInstance.errors, view:'create'
            return
        }

        pratoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'prato.label', default: 'Prato'), pratoInstance.id])
                redirect pratoInstance
            }
            '*' { respond pratoInstance, [status: CREATED] }
        }
    }

    def edit(Prato pratoInstance) {
        respond pratoInstance
    }

    @Transactional
    def update(Prato pratoInstance) {
        if (pratoInstance == null) {
            notFound()
            return
        }

        if (pratoInstance.hasErrors()) {
            respond pratoInstance.errors, view:'edit'
            return
        }

        pratoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Prato.label', default: 'Prato'), pratoInstance.id])
                redirect pratoInstance
            }
            '*'{ respond pratoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Prato pratoInstance) {

        if (pratoInstance == null) {
            notFound()
            return
        }

        pratoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Prato.label', default: 'Prato'), pratoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'prato.label', default: 'Prato'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
