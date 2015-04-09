
<%@ page import="webshop.Receiver" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'receiver.label', default: 'Receiver')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-receiver" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-receiver" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="email" title="${message(code: 'receiver.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'receiver.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="newsletter" title="${message(code: 'receiver.newsletter.label', default: 'Newsletter')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${receiverInstanceList}" status="i" var="receiverInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${receiverInstance.id}">${fieldValue(bean: receiverInstance, field: "email")}</g:link></td>
					
						<td>${fieldValue(bean: receiverInstance, field: "name")}</td>
					
						<td><g:formatBoolean boolean="${receiverInstance.newsletter}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${receiverInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
