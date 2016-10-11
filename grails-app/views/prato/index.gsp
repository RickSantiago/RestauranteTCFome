
<%@ page import="restaurantetcfome.Prato" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'prato.label', default: 'Prato')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-prato" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-prato" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nome" title="${message(code: 'prato.nome.label', default: 'Nome')}" />
					
						<g:sortableColumn property="preco" title="${message(code: 'prato.preco.label', default: 'Preco')}" />
					
						<g:sortableColumn property="quantidadePessoas" title="${message(code: 'prato.quantidadePessoas.label', default: 'Quantidade Pessoas')}" />
					
						<th><g:message code="prato.estoque.label" default="Estoque" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pratoInstanceList}" status="i" var="pratoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pratoInstance.id}">${fieldValue(bean: pratoInstance, field: "nome")}</g:link></td>
					
						<td>${fieldValue(bean: pratoInstance, field: "preco")}</td>
					
						<td>${fieldValue(bean: pratoInstance, field: "quantidadePessoas")}</td>
					
						<td>${fieldValue(bean: pratoInstance, field: "estoque")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pratoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
