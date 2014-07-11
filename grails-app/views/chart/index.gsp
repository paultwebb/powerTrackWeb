<%@ page import="org.grails.plugins.google.visualization.data.Cell; org.grails.plugins.google.visualization.util.DateUtil" %>
<!DOCTYPE html>

<html>
	<head>


	</head>
	<body>
	
	   <%
	def companyPerformanceColumns = [['string', 'Year'], ['number', 'Sales'], ['number', 'Expenses']]
    def companyPerformanceData = [['2004', 1000, 400], ['2005', 1170, 460], ['2006', 660, 1120], ['2007', 1030, 540]]
	   %>
	<table border='1'>
	<g:each in="${serviceAgreementInstanceList}" var="serviceAgreementInstance">
	  <tr>
	    <td>
	      <span class="tag">${serviceAgreementInstance.agreementCode}</span>
	    </td>
	    
	    <td>
	      <span class="tag">${serviceAgreementInstance.agreementString}</span>
	    </td>
	  </tr>
	</g:each>
	</table>
	Total ${serviceAgreementTotal }
	<table border='1'>
			<thead>
					<tr>
						<th>Code</th>
						<th>Min Date</th>
						<th>Max Date</th>
						<th>Distinct Days</th>
						<th>Date Range</th>
						<th>Measurements</th>
						<th>KW</th>				
					</tr>
			</thead>	
	<g:each in="${summaryRows}" var="summary">
	<tr>
	  <td> ${summary.agreementCode } </td>
	  <td> ${summary.mindate } </td>
	  <td> ${summary.maxdate } </td>
	  <td> ${summary.distinctdays } </td>
	  <td> ${summary.daterange } </td>
	  <td> ${summary.measurements } </td>
	  <td> ${summary.kw } </td>
	</tr>
	</g:each>
	</table>
	       <gvisualization:lineCoreChart elementId="linechart" width="${400}" height="${240}" 
	       title="Company Performance" columns="${companyPerformanceColumns}" data="${companyPerformanceData}" />

   <table cellpadding="2" cellspacing="0">
             <tr>
             <td>
                <a href="http://developers.google.com/chart/interactive/docs/gallery/linechart">Line Chart</a>
             </td>
             <td>
                <div id="linechart"></div>
             </td>
          </tr>
     </table>
	</body>