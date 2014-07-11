package org.ods.lincoln.ptw



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ServiceAgreementController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ServiceAgreement.list(params), model:[serviceAgreementInstanceCount: ServiceAgreement.count()]
    }

    def show(ServiceAgreement serviceAgreementInstance) {
        respond serviceAgreementInstance
    }

    def create() {
        respond new ServiceAgreement(params)
    }

    @Transactional
    def save(ServiceAgreement serviceAgreementInstance) {
        if (serviceAgreementInstance == null) {
            notFound()
            return
        }

        if (serviceAgreementInstance.hasErrors()) {
            respond serviceAgreementInstance.errors, view:'create'
            return
        }

        serviceAgreementInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'serviceAgreement.label', default: 'ServiceAgreement'), serviceAgreementInstance.id])
                redirect serviceAgreementInstance
            }
            '*' { respond serviceAgreementInstance, [status: CREATED] }
        }
    }

    def edit(ServiceAgreement serviceAgreementInstance) {
        respond serviceAgreementInstance
    }

    @Transactional
    def update(ServiceAgreement serviceAgreementInstance) {
        if (serviceAgreementInstance == null) {
            notFound()
            return
        }

        if (serviceAgreementInstance.hasErrors()) {
            respond serviceAgreementInstance.errors, view:'edit'
            return
        }

        serviceAgreementInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ServiceAgreement.label', default: 'ServiceAgreement'), serviceAgreementInstance.id])
                redirect serviceAgreementInstance
            }
            '*'{ respond serviceAgreementInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ServiceAgreement serviceAgreementInstance) {

        if (serviceAgreementInstance == null) {
            notFound()
            return
        }

        serviceAgreementInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ServiceAgreement.label', default: 'ServiceAgreement'), serviceAgreementInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'serviceAgreement.label', default: 'ServiceAgreement'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
