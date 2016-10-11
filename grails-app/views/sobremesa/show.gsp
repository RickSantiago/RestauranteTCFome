
<%@ page import="restaurantetcfome.Sobremesa" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sobremesa.label', default: 'Sobremesa')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-sobremesa" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-sobremesa" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list sobremesa">
			
				<g:if test="${sobremesaInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="sobremesa.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${sobremesaInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sobremesaInstance?.preco}">
				<li class="fieldcontain">
					<span id="preco-label" class="property-label"><g:message code="sobremesa.preco.label" default="Preco" /></span>
					
						<span class="property-value" aria-labelledby="preco-label"><g:fieldValue bean="${sobremesaInstance}" field="preco"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sobremesaInstance?.calorias}">
				<li class="fieldcontain">
					<span id="calorias-label" class="property-label"><g:message code="sobremesa.calorias.label" default="Calorias" /></span>
					
						<span class="property-value" aria-labelledby="calorias-label"><g:fieldValue bean="${sobremesaInstance}" field="calorias"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sobremesaInstance?.clientes}">
				<li class="fieldcontain">
					<span id="clientes-label" class="property-label"><g:message code="sobremesa.clientes.label" default="Clientes" /></span>
					
						<g:each in="${sobremesaInstance.clientes}" var="c">
						<span class="property-value" aria-labelledby="clientes-label"><g:link controller="cliente" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${sobremesaInstance?.estoque}">
				<li class="fieldcontain">
					<span id="estoque-label" class="property-label"><g:message code="sobremesa.estoque.label" default="Estoque" /></span>
					
						<span class="property-value" aria-labelledby="estoque-label"><g:link controller="estoque" action="show" id="${sobremesaInstance?.estoque?.id}">${sobremesaInstance?.estoque?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${sobremesaInstance?.itens}">
				<li class="fieldcontain">
					<span id="itens-label" class="property-label"><g:message code="sobremesa.itens.label" default="Itens" /></span>
					
						<g:each in="${sobremesaInstance.itens}" var="i">
						<span class="property-value" aria-labelledby="itens-label"><g:link controller="itemPedido" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:sobremesaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${sobremesaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
