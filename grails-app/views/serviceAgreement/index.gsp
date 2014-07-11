
<%@ page import="org.ods.lincoln.ptw.ServiceAgreement" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'serviceAgreement.label', default: 'ServiceAgreement')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-serviceAgreement" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-serviceAgreement" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="agreementCode" title="${message(code: 'serviceAgreement.agreementCode.label', default: 'Agreement Code')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'serviceAgreement.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="agreementString" title="${message(code: 'serviceAgreement.agreementString.label', default: 'Agreement String')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'serviceAgreement.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'serviceAgreement.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${serviceAgreementInstanceList}" status="i" var="serviceAgreementInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${serviceAgreementInstance.id}">${fieldValue(bean: serviceAgreementInstance, field: "agreementCode")}</g:link></td>
					
						<td>${fieldValue(bean: serviceAgreementInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: serviceAgreementInstance, field: "agreementString")}</td>
					
						<td>${fieldValue(bean: serviceAgreementInstance, field: "dateCreated")}</td>
					
						<td>${fieldValue(bean: serviceAgreementInstance, field: "lastUpdated")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${serviceAgreementInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
