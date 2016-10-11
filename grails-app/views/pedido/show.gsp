
<%@ page import="restaurantetcfome.Pedido" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pedido.label', default: 'Pedido')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-pedido" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-pedido" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list pedido">
			
				<g:if test="${pedidoInstance?.valorTotal}">
				<li class="fieldcontain">
					<span id="valorTotal-label" class="property-label"><g:message code="pedido.valorTotal.label" default="Valor Total" /></span>
					
						<span class="property-value" aria-labelledby="valorTotal-label"><g:fieldValue bean="${pedidoInstance}" field="valorTotal"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pedidoInstance?.cliente}">
				<li class="fieldcontain">
					<span id="cliente-label" class="property-label"><g:message code="pedido.cliente.label" default="Cliente" /></span>
					
						<span class="property-value" aria-labelledby="cliente-label"><g:link controller="cliente" action="show" id="${pedidoInstance?.cliente?.id}">${pedidoInstance?.cliente?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${pedidoInstance?.dataHora}">
				<li class="fieldcontain">
					<span id="dataHora-label" class="property-label"><g:message code="pedido.dataHora.label" default="Data Hora" /></span>
					
						<span class="property-value" aria-labelledby="dataHora-label"><g:formatDate date="${pedidoInstance?.dataHora}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pedidoInstance?.itens}">
				<li class="fieldcontain">
					<span id="itens-label" class="property-label"><g:message code="pedido.itens.label" default="Itens" /></span>
					
						<g:each in="${pedidoInstance.itens}" var="i">
						<span class="property-value" aria-labelledby="itens-label"><g:link controller="itemPedido" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:pedidoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${pedidoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
