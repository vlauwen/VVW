package webshop



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ReceiverController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def unsubscribe(int id){
        Receiver r = Receiver.get(id)
        r.setNewsletter(false)
        r.save(flush:true)
        redirect(uri: "/receiver/edit/$id")
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Receiver.list(params), model:[receiverInstanceCount: Receiver.count()]
    }

    def show(Receiver receiverInstance) {
        respond receiverInstance
    }

    def create() {
        respond new Receiver(params)
    }

    @Transactional
    def save(Receiver receiverInstance) {
        if (receiverInstance == null) {
            notFound()
            return
        }

        if (receiverInstance.hasErrors()) {
            respond receiverInstance.errors, view:'create'
            return
        }

        receiverInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'receiver.label', default: 'Receiver'), receiverInstance.id])
                redirect receiverInstance
            }
            '*' { respond receiverInstance, [status: CREATED] }
        }
    }

    def edit(Receiver receiverInstance) {
        respond receiverInstance
    }

    @Transactional
    def update(Receiver receiverInstance) {
        if (receiverInstance == null) {
            notFound()
            return
        }

        if (receiverInstance.hasErrors()) {
            respond receiverInstance.errors, view:'edit'
            return
        }

        receiverInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Receiver.label', default: 'Receiver'), receiverInstance.id])
                redirect receiverInstance
            }
            '*'{ respond receiverInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Receiver receiverInstance) {

        if (receiverInstance == null) {
            notFound()
            return
        }

        receiverInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Receiver.label', default: 'Receiver'), receiverInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'receiver.label', default: 'Receiver'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
