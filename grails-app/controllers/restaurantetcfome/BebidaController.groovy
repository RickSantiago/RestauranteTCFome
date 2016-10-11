package restaurantetcfome



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class BebidaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Bebida.list(params), model:[bebidaInstanceCount: Bebida.count()]
    }

    def show(Bebida bebidaInstance) {
        respond bebidaInstance
    }

    def create() {
        respond new Bebida(params)
    }

    @Transactional
    def save(Bebida bebidaInstance) {
        if (bebidaInstance == null) {
            notFound()
            return
        }

        if (bebidaInstance.hasErrors()) {
            respond bebidaInstance.errors, view:'create'
            return
        }

        bebidaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'bebida.label', default: 'Bebida'), bebidaInstance.id])
                redirect bebidaInstance
            }
            '*' { respond bebidaInstance, [status: CREATED] }
        }
    }

    def edit(Bebida bebidaInstance) {
        respond bebidaInstance
    }

    @Transactional
    def update(Bebida bebidaInstance) {
        if (bebidaInstance == null) {
            notFound()
            return
        }

        if (bebidaInstance.hasErrors()) {
            respond bebidaInstance.errors, view:'edit'
            return
        }

        bebidaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Bebida.label', default: 'Bebida'), bebidaInstance.id])
                redirect bebidaInstance
            }
            '*'{ respond bebidaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Bebida bebidaInstance) {

        if (bebidaInstance == null) {
            notFound()
            return
        }

        bebidaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Bebida.label', default: 'Bebida'), bebidaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'bebida.label', default: 'Bebida'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
