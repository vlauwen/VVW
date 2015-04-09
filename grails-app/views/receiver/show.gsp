
<%@ page import="webshop.Receiver" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'receiver.label', default: 'Receiver')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-receiver" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-receiver" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list receiver">
			
				<g:if test="${receiverInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="receiver.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${receiverInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${receiverInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="receiver.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${receiverInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${receiverInstance?.newsletter}">
				<li class="fieldcontain">
					<span id="newsletter-label" class="property-label"><g:message code="receiver.newsletter.label" default="Newsletter" /></span>
					
						<span class="property-value" aria-labelledby="newsletter-label"><g:formatBoolean boolean="${receiverInstance?.newsletter}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:receiverInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${receiverInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
