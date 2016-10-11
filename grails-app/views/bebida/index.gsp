
<%@ page import="restaurantetcfome.Bebida" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bebida.label', default: 'Bebida')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-bebida" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-bebida" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nome" title="${message(code: 'bebida.nome.label', default: 'Nome')}" />
					
						<g:sortableColumn property="preco" title="${message(code: 'bebida.preco.label', default: 'Preco')}" />
					
						<g:sortableColumn property="liquido" title="${message(code: 'bebida.liquido.label', default: 'Liquido')}" />
					
						<g:sortableColumn property="unidade" title="${message(code: 'bebida.unidade.label', default: 'Unidade')}" />
					
						<th><g:message code="bebida.estoque.label" default="Estoque" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${bebidaInstanceList}" status="i" var="bebidaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${bebidaInstance.id}">${fieldValue(bean: bebidaInstance, field: "nome")}</g:link></td>
					
						<td>${fieldValue(bean: bebidaInstance, field: "preco")}</td>
					
						<td>${fieldValue(bean: bebidaInstance, field: "liquido")}</td>
					
						<td>${fieldValue(bean: bebidaInstance, field: "unidade")}</td>
					
						<td>${fieldValue(bean: bebidaInstance, field: "estoque")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bebidaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
