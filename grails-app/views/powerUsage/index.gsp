
<%@ page import="org.ods.lincoln.ptw.PowerUsage" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'powerUsage.label', default: 'PowerUsage')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-powerUsage" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-powerUsage" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="powerUsage.serviceAgreement.label" default="Service Agreement" /></th>
					
						<g:sortableColumn property="startTime" title="${message(code: 'powerUsage.startTime.label', default: 'Start Time')}" />
					
						<g:sortableColumn property="endTime" title="${message(code: 'powerUsage.endTime.label', default: 'End Time')}" />
					
						<g:sortableColumn property="quantity" title="${message(code: 'powerUsage.quantity.label', default: 'Quantity')}" />
					
						<g:sortableColumn property="uom" title="${message(code: 'powerUsage.uom.label', default: 'Uom')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${powerUsageInstanceList}" status="i" var="powerUsageInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${powerUsageInstance.id}">${fieldValue(bean: powerUsageInstance, field: "serviceAgreement")}</g:link></td>
					
						<td>${fieldValue(bean: powerUsageInstance, field: "startTime")}</td>
					
						<td>${fieldValue(bean: powerUsageInstance, field: "endTime")}</td>
					
						<td>${fieldValue(bean: powerUsageInstance, field: "quantity")}</td>
					
						<td>${fieldValue(bean: powerUsageInstance, field: "uom")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${powerUsageInstanceCount ?: 0}" />
			</div>
		</div>
		<g:link controller='loadCsv' action='loadFromUsage'>Load Usage</g:link><BR>
	</body>
</html>
