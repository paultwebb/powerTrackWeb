package org.ods.lincoln.ptw

import grails.transaction.Transactional
import groovy.sql.Sql
import groovy.sql.GroovyRowResult

// http://java.dzone.com/articles/grails-goodness-using-groovy


@Transactional
class ChartService {

   // Reference to default datasource.
    def dataSource

    List<GroovyRowResult> allCharts() {
       // final String searchString = "%${searchQuery.toUpperCase()}%"
		log.trace "In ChartService"
		
	    //final String query = "select agreement_code from service_agreement"
		final String query = "\
select agreement_code as agreementCode, DATE_FORMAT(min(start_time), '%Y-%m-%d') mindate,\
       DATE_FORMAT(max(start_time), '%Y-%m-%d') maxdate, count(distinct DATE_FORMAT(start_time, '%Y-%m-%d')) distinctdays,\
       datediff(max(start_time),min(start_time)) + 1 daterange, count(*) measurements,\
        sum(quantity) kw\
 from power_usage pa, service_agreement sa\
 where pa.service_agreement_id = sa.id \
   and quantity <> 0 \
group by agreement_code   \
order by 1,2"
		//def rows = sql.rows("select agreement_code, min(start_time) as mindate,max(start_time) as maxdate, count(distinct start_time) as distinctdays,   datediff(max(start_time),min(start_time)) + 1 as daterange, count(*) as measurements,        sum(quantity) as kwh from power_Usage pa, service_Agreement sa where pa.service_agreement_id = sa.id group by agreement_code order by 1,2")
	
        // Create new Groovy SQL instance with injected DataSource.
        final Sql sql = new Sql(dataSource)

		sql.eachRow(query) {
			log.trace it
		}
		
        final results = sql.rows(query)
		//render 'hello'
		log.trace results[0]
		log.trace results.size()
        results
    }
}
