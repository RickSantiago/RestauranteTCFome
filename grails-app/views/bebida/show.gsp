
<%@ page import="restaurantetcfome.Bebida" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bebida.label', default: 'Bebida')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bebida" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bebida" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bebida">
			
				<g:if test="${bebidaInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="bebida.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${bebidaInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bebidaInstance?.preco}">
				<li class="fieldcontain">
					<span id="preco-label" class="property-label"><g:message code="bebida.preco.label" default="Preco" /></span>
					
						<span class="property-value" aria-labelledby="preco-label"><g:fieldValue bean="${bebidaInstance}" field="preco"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bebidaInstance?.liquido}">
				<li class="fieldcontain">
					<span id="liquido-label" class="property-label"><g:message code="bebida.liquido.label" default="Liquido" /></span>
					
						<span class="property-value" aria-labelledby="liquido-label"><g:fieldValue bean="${bebidaInstance}" field="liquido"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bebidaInstance?.unidade}">
				<li class="fieldcontain">
					<span id="unidade-label" class="property-label"><g:message code="bebida.unidade.label" default="Unidade" /></span>
					
						<span class="property-value" aria-labelledby="unidade-label"><g:fieldValue bean="${bebidaInstance}" field="unidade"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bebidaInstance?.clientes}">
				<li class="fieldcontain">
					<span id="clientes-label" class="property-label"><g:message code="bebida.clientes.label" default="Clientes" /></span>
					
						<g:each in="${bebidaInstance.clientes}" var="c">
						<span class="property-value" aria-labelledby="clientes-label"><g:link controller="cliente" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${bebidaInstance?.estoque}">
				<li class="fieldcontain">
					<span id="estoque-label" class="property-label"><g:message code="bebida.estoque.label" default="Estoque" /></span>
					
						<span class="property-value" aria-labelledby="estoque-label"><g:link controller="estoque" action="show" id="${bebidaInstance?.estoque?.id}">${bebidaInstance?.estoque?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bebidaInstance?.itens}">
				<li class="fieldcontain">
					<span id="itens-label" class="property-label"><g:message code="bebida.itens.label" default="Itens" /></span>
					
						<g:each in="${bebidaInstance.itens}" var="i">
						<span class="property-value" aria-labelledby="itens-label"><g:link controller="itemPedido" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:bebidaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${bebidaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
