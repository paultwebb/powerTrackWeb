package org.ods.lincoln.ptw

//import powertrack.BigDecimal;

class PowerUsage {

	//PROPERTIES
	java.sql.Timestamp startTime
	java.sql.Timestamp endTime
	BigDecimal quantity
	String uom
	java.sql.Timestamp dateCreated
	java.sql.Timestamp lastUpdated
	
	// RELATIONSHIP PROPERTIES
	static belongsTo = [serviceAgreement:ServiceAgreement]
	
    static constraints = {
		serviceAgreement (blank:false, unique:'startTime')
		startTime (blank:false)
		endTime (blank:false)
		quantity (blank:false)
		uom (blank:false)
		
    }

    // MAPPING
	static mapping = {
	}
	
	// METHODS
	String toString() {
		//return "County: code=${code}, county=${county}, countySeat=${countySeat}"
		return quantity
	}
}
