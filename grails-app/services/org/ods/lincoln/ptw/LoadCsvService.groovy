package org.ods.lincoln.ptw

import grails.transaction.Transactional

@Transactional

import java.text.DateFormat
import java.text.SimpleDateFormat
import org.grails.plugins.csv.CSVMapReader
import org.apache.commons.lang.RandomStringUtils
class LoadCsvService {
	
	def DataSource
	String filePath = "data"
	String fileName
	Integer deletes
	Integer loads
	Integer errors
	Integer updates
	Integer records
	Integer statusCount = 100

	def loadUsages() {
		
		//2014-03-10-00.00.00
		SimpleDateFormat df	= new SimpleDateFormat("yyyy-MM-dd-HH.mm.ss");
		//DateFormat df	= new DateFormat("yyyy-MM-dd HH.mm.ss");
		
				//DateFormat df = DateFormat.getDateInstance(DateFormat.LONG, Locale.US);
		//String saCode
		ServiceAgreement curServiceAgreement
		loads=0;updates=0;errors=0;deletes=0;records=0
		//deletes=PowerUsage.executeUpdate('delete PowerUsage')
		//deletes=ServiceAgreement.executeUpdate('delete ServiceAgreement')
		
		fileName = "UsageData.csv"
		println "Loading ${filePath}/${fileName}"
		PowerUsage curPowerUsage
		def reader = new File("${filePath}/${fileName}").toCsvMapReader()
		def results = [:]
		reader.each { map ->
			curServiceAgreement = ServiceAgreement?.findByAgreementString(map.'Service Agreement')
			records++
			if (!curServiceAgreement) {
			  println "Adding Service Agreement ${map.'Service Agreement'}"
			  curServiceAgreement = new ServiceAgreement()
			  curServiceAgreement.agreementString = map.'Service Agreement'
			  // Generate a random string for the Code, to be update later
			  String charset = (('a'..'z') + ('A'..'Z') + ('0'..'9')).join()
			  curServiceAgreement.agreementCode = RandomStringUtils.random(5, charset.toCharArray())
			  curServiceAgreement.description = "Added " + new Date()
			  if (!curServiceAgreement.save()) {
				  println "Error ${map}"
				  println curServiceAgreement.errors
			  } else {
			   //  println "Using SA $curServiceAgreement.agreementString"
			  }
			}
			curPowerUsage = new PowerUsage()
			curPowerUsage.serviceAgreement = curServiceAgreement
			curPowerUsage.startTime = df.parse(map.'Interval Start Time').toTimestamp()
			curPowerUsage.endTime = df.parse(map.'Interval End Time').toTimestamp()
			curPowerUsage.quantity = map.'Quantity'.toBigDecimal()
			curPowerUsage.uom = map.'Unit of Measure'
			if (!curPowerUsage.save()) {
				//println "Error ${map}"
				//println curPowerUsage.errors
				curPowerUsage.errors.allErrors.each { 
					// If we find a dup, update the values
					if (it.code == 'unique') {
						//println it.code
						def updPowerUsage = PowerUsage.findByServiceAgreementAndStartTime(curServiceAgreement,df.parse(map.'Interval Start Time').toTimestamp())
						//println "pu: " + updPowerUsage.id
						updPowerUsage.endTime = df.parse(map.'Interval End Time').toTimestamp()
						updPowerUsage.quantity = map.'Quantity'.toBigDecimal()
						//println "New qty: " + updPowerUsage.quantity 
						updPowerUsage.uom = map.'Unit of Measure'
						//println "before: " + updPowerUsage.uom
						//updPowerUsage.uom = "x"
						updPowerUsage.save(flush: true)
						//println "after: " + updPowerUsage.uom 
						if (!updPowerUsage.save()) {
							println "Error in update ${map}"
							println updPowerUsages.errors
						} else {
						   // println "Updated"
						    updates++
						}
					} else {
					    println "ERROR: " + it
						errors++
					}
				}
			} else {
				loads ++
			}
			if (records == statusCount) {
				println "   ${deletes} deleted. ${loads} loaded. ${updates} updated. ${errors} errors."
				records = 0
			}
		}
		println "   ${deletes} deleted. ${loads} loaded. ${updates} updated. ${errors} errors."
		println "done."
		return ['table':'UsageData','deletes':deletes,'loads':loads,'updates':updates,'errors':errors]
		
	}
}
