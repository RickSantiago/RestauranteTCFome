
<%@ page import="restaurantetcfome.Sobremesa" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sobremesa.label', default: 'Sobremesa')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-sobremesa" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-sobremesa" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nome" title="${message(code: 'sobremesa.nome.label', default: 'Nome')}" />
					
						<g:sortableColumn property="preco" title="${message(code: 'sobremesa.preco.label', default: 'Preco')}" />
					
						<g:sortableColumn property="calorias" title="${message(code: 'sobremesa.calorias.label', default: 'Calorias')}" />
					
						<th><g:message code="sobremesa.estoque.label" default="Estoque" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${sobremesaInstanceList}" status="i" var="sobremesaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${sobremesaInstance.id}">${fieldValue(bean: sobremesaInstance, field: "nome")}</g:link></td>
					
						<td>${fieldValue(bean: sobremesaInstance, field: "preco")}</td>
					
						<td>${fieldValue(bean: sobremesaInstance, field: "calorias")}</td>
					
						<td>${fieldValue(bean: sobremesaInstance, field: "estoque")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${sobremesaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
