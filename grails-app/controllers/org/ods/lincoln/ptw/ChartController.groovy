package org.ods.lincoln.ptw
import groovy.sql.Sql
import groovy.sql.GroovyRowResult

class ChartController {

	
	def chartService 
    def index() {
		
		log.trace "Tracing"
		
		def getSummary = chartService?.allCharts()
		
		[serviceAgreementInstanceList: ServiceAgreement.list() ,
		serviceAgreementTotal: ServiceAgreement.count(),
		summaryRows: getSummary]
	}	
}

