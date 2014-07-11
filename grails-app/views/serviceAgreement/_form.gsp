<%@ page import="org.ods.lincoln.ptw.ServiceAgreement" %>



<div class="fieldcontain ${hasErrors(bean: serviceAgreementInstance, field: 'agreementCode', 'error')} required">
	<label for="agreementCode">
		<g:message code="serviceAgreement.agreementCode.label" default="Agreement Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="agreementCode" maxlength="5" required="" value="${serviceAgreementInstance?.agreementCode}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: serviceAgreementInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="serviceAgreement.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" maxlength="50" required="" value="${serviceAgreementInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: serviceAgreementInstance, field: 'agreementString', 'error')} required">
	<label for="agreementString">
		<g:message code="serviceAgreement.agreementString.label" default="Agreement String" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="agreementString" maxlength="200" required="" value="${serviceAgreementInstance?.agreementString}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: serviceAgreementInstance, field: 'powerUsages', 'error')} ">
	<label for="powerUsages">
		<g:message code="serviceAgreement.powerUsages.label" default="Power Usages" />
		
	</label>

<%-- 	
<ul class="one-to-many">
<g:each in="${serviceAgreementInstance?.powerUsages?}" var="p">
    <li><g:link controller="powerUsage" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="powerUsage" action="create" params="['serviceAgreement.id': serviceAgreementInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'powerUsage.label', default: 'PowerUsage')])}</g:link>
</li>
</ul>
--%>


</div>

