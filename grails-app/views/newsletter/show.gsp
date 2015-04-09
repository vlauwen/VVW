<%@ page import="webshop.Newsletter" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'newsletter.label', default: 'Newsletter')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-newsletter" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                 default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-newsletter" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list newsletter">

        <g:if test="${newsletterInstance?.content}">
            <li class="fieldcontain">
                <span id="content-label" class="property-label"><g:message code="newsletter.content.label"
                                                                           default="Content"/></span>

                <span class="property-value" aria-labelledby="content-label"><g:fieldValue bean="${newsletterInstance}"
                                                                                           field="content"/></span>

            </li>
        </g:if>

        <g:if test="${newsletterInstance?.dateSendMail}">
            <li class="fieldcontain">
                <span id="dateSendMail-label" class="property-label"><g:message code="newsletter.dateSendMail.label"
                                                                                default="Date Send Mail"/></span>

                <span class="property-value" aria-labelledby="dateSendMail-label"><g:formatDate
                        date="${newsletterInstance?.dateSendMail}"/></span>

            </li>
        </g:if>

        <g:if test="${newsletterInstance?.receivers}">
            <li class="fieldcontain">
                <span id="receivers-label" class="property-label"><g:message code="newsletter.receivers.label"
                                                                             default="Receivers"/></span>

                <g:each in="${newsletterInstance.receivers}" var="r">
                    <span class="property-value" aria-labelledby="receivers-label"><g:link controller="receiver"
                                                                                           action="show"
                                                                                           id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${newsletterInstance?.title}">
            <li class="fieldcontain">
                <span id="title-label" class="property-label"><g:message code="newsletter.title.label"
                                                                         default="Title"/></span>

                <span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${newsletterInstance}"
                                                                                         field="title"/></span>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource: newsletterInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${newsletterInstance}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
