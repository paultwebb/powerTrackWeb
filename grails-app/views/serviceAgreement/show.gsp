
<%@ page import="org.ods.lincoln.ptw.ServiceAgreement" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'serviceAgreement.label', default: 'ServiceAgreement')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-serviceAgreement" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-serviceAgreement" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list serviceAgreement">
			
				<g:if test="${serviceAgreementInstance?.agreementCode}">
				<li class="fieldcontain">
					<span id="agreementCode-label" class="property-label"><g:message code="serviceAgreement.agreementCode.label" default="Agreement Code" /></span>
					
						<span class="property-value" aria-labelledby="agreementCode-label"><g:fieldValue bean="${serviceAgreementInstance}" field="agreementCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceAgreementInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="serviceAgreement.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${serviceAgreementInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceAgreementInstance?.agreementString}">
				<li class="fieldcontain">
					<span id="agreementString-label" class="property-label"><g:message code="serviceAgreement.agreementString.label" default="Agreement String" /></span>
					
						<span class="property-value" aria-labelledby="agreementString-label"><g:fieldValue bean="${serviceAgreementInstance}" field="agreementString"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceAgreementInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="serviceAgreement.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:fieldValue bean="${serviceAgreementInstance}" field="dateCreated"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceAgreementInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="serviceAgreement.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:fieldValue bean="${serviceAgreementInstance}" field="lastUpdated"/></span>
					
				</li>
				</g:if>
<%-- 			
				<g:if test="${serviceAgreementInstance?.powerUsages}">
				<li class="fieldcontain">
					<span id="powerUsages-label" class="property-label"><g:message code="serviceAgreement.powerUsages.label" default="Power Usages" /></span>
					
						<g:each in="${serviceAgreementInstance.powerUsages}" var="p">
						<span class="property-value" aria-labelledby="powerUsages-label"><g:link controller="powerUsage" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
--%>
			</ol>
			<g:form url="[resource:serviceAgreementInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${serviceAgreementInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
