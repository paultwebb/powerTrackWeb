<%@ page import="org.ods.lincoln.ptw.PowerUsage" %>



<div class="fieldcontain ${hasErrors(bean: powerUsageInstance, field: 'serviceAgreement', 'error')} required">
	<label for="serviceAgreement">
		<g:message code="powerUsage.serviceAgreement.label" default="Service Agreement" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="serviceAgreement" name="serviceAgreement.id" from="${org.ods.lincoln.ptw.ServiceAgreement.list()}" optionKey="id" required="" value="${powerUsageInstance?.serviceAgreement?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: powerUsageInstance, field: 'startTime', 'error')} required">
	<label for="startTime">
		<g:message code="powerUsage.startTime.label" default="Start Time" />
		<span class="required-indicator">*</span>
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: powerUsageInstance, field: 'endTime', 'error')} required">
	<label for="endTime">
		<g:message code="powerUsage.endTime.label" default="End Time" />
		<span class="required-indicator">*</span>
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: powerUsageInstance, field: 'quantity', 'error')} required">
	<label for="quantity">
		<g:message code="powerUsage.quantity.label" default="Quantity" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantity" value="${fieldValue(bean: powerUsageInstance, field: 'quantity')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: powerUsageInstance, field: 'uom', 'error')} required">
	<label for="uom">
		<g:message code="powerUsage.uom.label" default="Uom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="uom" required="" value="${powerUsageInstance?.uom}"/>

</div>

