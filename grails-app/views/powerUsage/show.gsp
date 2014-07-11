
<%@ page import="org.ods.lincoln.ptw.PowerUsage" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'powerUsage.label', default: 'PowerUsage')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-powerUsage" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-powerUsage" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list powerUsage">
			
				<g:if test="${powerUsageInstance?.serviceAgreement}">
				<li class="fieldcontain">
					<span id="serviceAgreement-label" class="property-label"><g:message code="powerUsage.serviceAgreement.label" default="Service Agreement" /></span>
					
						<span class="property-value" aria-labelledby="serviceAgreement-label"><g:link controller="serviceAgreement" action="show" id="${powerUsageInstance?.serviceAgreement?.id}">${powerUsageInstance?.serviceAgreement?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${powerUsageInstance?.startTime}">
				<li class="fieldcontain">
					<span id="startTime-label" class="property-label"><g:message code="powerUsage.startTime.label" default="Start Time" /></span>
					
						<span class="property-value" aria-labelledby="startTime-label"><g:fieldValue bean="${powerUsageInstance}" field="startTime"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${powerUsageInstance?.endTime}">
				<li class="fieldcontain">
					<span id="endTime-label" class="property-label"><g:message code="powerUsage.endTime.label" default="End Time" /></span>
					
						<span class="property-value" aria-labelledby="endTime-label"><g:fieldValue bean="${powerUsageInstance}" field="endTime"/></span>
					
				</li>
				</g:if>
			
<%-- 			<g:if test="${powerUsageInstance?.quantity}"> --%>	
				<li class="fieldcontain">
					<span id="quantity-label" class="property-label"><g:message code="powerUsage.quantity.label" default="Quantity" /></span>
					
						<span class="property-value" aria-labelledby="quantity-label"><g:fieldValue bean="${powerUsageInstance}" field="quantity"/></span>
					
				</li>
<%-- 				</g:if> --%>	
			
				<g:if test="${powerUsageInstance?.uom}">
				<li class="fieldcontain">
					<span id="uom-label" class="property-label"><g:message code="powerUsage.uom.label" default="Uom" /></span>
					
						<span class="property-value" aria-labelledby="uom-label"><g:fieldValue bean="${powerUsageInstance}" field="uom"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:powerUsageInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${powerUsageInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
