<%@ page import="restaurantetcfome.Produto" %>



<div class="fieldcontain ${hasErrors(bean: produtoInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="produto.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${produtoInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: produtoInstance, field: 'preco', 'error')} required">
	<label for="preco">
		<g:message code="produto.preco.label" default="Preco" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="preco" value="${fieldValue(bean: produtoInstance, field: 'preco')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: produtoInstance, field: 'clientes', 'error')} ">
	<label for="clientes">
		<g:message code="produto.clientes.label" default="Clientes" />
		
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: produtoInstance, field: 'estoque', 'error')} required">
	<label for="estoque">
		<g:message code="produto.estoque.label" default="Estoque" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="estoque" name="estoque.id" from="${restaurantetcfome.Estoque.list()}" optionKey="id" required="" value="${produtoInstance?.estoque?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: produtoInstance, field: 'itens', 'error')} ">
	<label for="itens">
		<g:message code="produto.itens.label" default="Itens" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${produtoInstance?.itens?}" var="i">
    <li><g:link controller="itemPedido" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="itemPedido" action="create" params="['produto.id': produtoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'itemPedido.label', default: 'ItemPedido')])}</g:link>
</li>
</ul>


</div>

