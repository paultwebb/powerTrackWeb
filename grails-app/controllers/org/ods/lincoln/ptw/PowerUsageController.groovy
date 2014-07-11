package org.ods.lincoln.ptw



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PowerUsageController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PowerUsage.list(params), model:[powerUsageInstanceCount: PowerUsage.count()]
    }

    def show(PowerUsage powerUsageInstance) {
        respond powerUsageInstance
    }

    def create() {
        respond new PowerUsage(params)
    }

    @Transactional
    def save(PowerUsage powerUsageInstance) {
        if (powerUsageInstance == null) {
            notFound()
            return
        }

        if (powerUsageInstance.hasErrors()) {
            respond powerUsageInstance.errors, view:'create'
            return
        }

        powerUsageInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'powerUsage.label', default: 'PowerUsage'), powerUsageInstance.id])
                redirect powerUsageInstance
            }
            '*' { respond powerUsageInstance, [status: CREATED] }
        }
    }

    def edit(PowerUsage powerUsageInstance) {
        respond powerUsageInstance
    }

    @Transactional
    def update(PowerUsage powerUsageInstance) {
        if (powerUsageInstance == null) {
            notFound()
            return
        }

        if (powerUsageInstance.hasErrors()) {
            respond powerUsageInstance.errors, view:'edit'
            return
        }

        powerUsageInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'PowerUsage.label', default: 'PowerUsage'), powerUsageInstance.id])
                redirect powerUsageInstance
            }
            '*'{ respond powerUsageInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(PowerUsage powerUsageInstance) {

        if (powerUsageInstance == null) {
            notFound()
            return
        }

        powerUsageInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'PowerUsage.label', default: 'PowerUsage'), powerUsageInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'powerUsage.label', default: 'PowerUsage'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
