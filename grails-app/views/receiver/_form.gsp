<%@ page import="webshop.Receiver" %>



<div class="fieldcontain ${hasErrors(bean: receiverInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="receiver.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${receiverInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: receiverInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="receiver.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${receiverInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: receiverInstance, field: 'newsletter', 'error')} ">
	<label for="newsletter">
		<g:message code="receiver.newsletter.label" default="Newsletter" />
		
	</label>
	<g:checkBox name="newsletter" value="${receiverInstance?.newsletter}" />

</div>

