package org.ods.lincoln.ptw

class ServiceAgreement {

	//PROPERTIES
	String agreementCode
	String agreementString
	String description
	java.sql.Timestamp dateCreated
	java.sql.Timestamp lastUpdated
	
	// RELATIONSHIP PROPERTIES
	static hasMany = [powerUsages:PowerUsage]
	
    static constraints = {
		agreementCode (blank:false, unique:true, maxSize:5)
		description(blank:false, maxSize:50 )
		agreementString (blank:false, unique:true, maxSize:200)
    }

    // MAPPING
	static mapping = {
	}
	
	// METHODS
	String toString() {
		//return "County: code=${code}, county=${county}, countySeat=${countySeat}"
		return agreementCode
	}
}
