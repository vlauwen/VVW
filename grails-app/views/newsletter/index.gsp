<%@ page import="webshop.Newsletter" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'newsletter.label', default: 'Newsletter')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-newsletter" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                 default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-newsletter" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="content"
                              title="${message(code: 'newsletter.content.label', default: 'Content')}"/>

            <g:sortableColumn property="dateSendMail"
                              title="${message(code: 'newsletter.dateSendMail.label', default: 'Date Send Mail')}"/>

            <g:sortableColumn property="title" title="${message(code: 'newsletter.title.label', default: 'Title')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${newsletterInstanceList}" status="i" var="newsletterInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${newsletterInstance.id}">${fieldValue(bean: newsletterInstance, field: "content")}</g:link></td>

                <td><g:formatDate date="${newsletterInstance.dateSendMail}"/></td>

                <td>${fieldValue(bean: newsletterInstance, field: "title")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${newsletterInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
