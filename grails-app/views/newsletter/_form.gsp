<%@ page import="webshop.Newsletter" %>

<div class="fieldcontain ${hasErrors(bean: newsletterInstance, field: 'title', 'error')} required">
    <label for="title">
        <g:message code="newsletter.title.label" default="Title"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="title" required="" value="${newsletterInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: newsletterInstance, field: 'receivers', 'error')} ">
    <label for="receivers">
        <g:message code="newsletter.receivers.label" default="Receivers"/>

    </label>
    <g:select name="receivers" from="${webshop.Receiver.findAll{newsletter == true}}" multiple="multiple" optionKey="id" size="5"
              value="${newsletterInstance?.receivers*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: newsletterInstance, field: 'content', 'error')} required">
    <label for="content">
        <g:message code="newsletter.content.label" default="Content"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textArea name="content" cols="40" rows="5" maxlength="1200" required="" value="${newsletterInstance?.content}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: newsletterInstance, field: 'dateSendMail', 'error')} required">
    <label for="dateSendMail">
        <g:message code="newsletter.dateSendMail.label" default="Date Send Mail"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="dateSendMail" precision="day" value="${newsletterInstance?.dateSendMail}"/>

</div>


