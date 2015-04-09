package webshop


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class NewsletterController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Newsletter.list(params), model: [newsletterInstanceCount: Newsletter.count()]
    }

    def show(Newsletter newsletterInstance) {
        respond newsletterInstance
    }

    def create() {
        respond new Newsletter(params)
    }

    @Transactional
    def save(Newsletter newsletterInstance) {
        if (newsletterInstance == null) {
            notFound()
            return
        }

        if (newsletterInstance.hasErrors()) {
            respond newsletterInstance.errors, view: 'create'
            return
        }

        for (Receiver r : newsletterInstance.receivers){
            System.out.println(r.id);
            System.out.println(r.getId());
            sendMail {
                to r.email
                subject newsletterInstance.title
                html '<p>' + newsletterInstance.content + '</p> <a href="http://localhost:8080/Webshop/receiver/unsubscribe/' + r.id + '">Uitschrijven nieuwsbrief</a>'
        }

        }

        newsletterInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'newsletter.label', default: 'Newsletter'), newsletterInstance.id])
                redirect newsletterInstance
            }
            '*' { respond newsletterInstance, [status: CREATED] }
        }
    }

    def edit(Newsletter newsletterInstance) {
        respond newsletterInstance
    }

    @Transactional
    def update(Newsletter newsletterInstance) {
        if (newsletterInstance == null) {
            notFound()
            return
        }

        if (newsletterInstance.hasErrors()) {
            respond newsletterInstance.errors, view: 'edit'
            return
        }

        newsletterInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Newsletter.label', default: 'Newsletter'), newsletterInstance.id])
                redirect newsletterInstance
            }
            '*' { respond newsletterInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Newsletter newsletterInstance) {

        if (newsletterInstance == null) {
            notFound()
            return
        }

        newsletterInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Newsletter.label', default: 'Newsletter'), newsletterInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'newsletter.label', default: 'Newsletter'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
