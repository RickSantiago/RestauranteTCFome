<%@ page import="restaurantetcfome.Prato" %>



<div class="fieldcontain ${hasErrors(bean: pratoInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="prato.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${pratoInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: pratoInstance, field: 'preco', 'error')} required">
	<label for="preco">
		<g:message code="prato.preco.label" default="Preco" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="preco" value="${fieldValue(bean: pratoInstance, field: 'preco')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: pratoInstance, field: 'quantidadePessoas', 'error')} required">
	<label for="quantidadePessoas">
		<g:message code="prato.quantidadePessoas.label" default="Quantidade Pessoas" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantidadePessoas" type="number" min="1" value="${pratoInstance.quantidadePessoas}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: pratoInstance, field: 'clientes', 'error')} ">
	<label for="clientes">
		<g:message code="prato.clientes.label" default="Clientes" />
		
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: pratoInstance, field: 'estoque', 'error')} required">
	<label for="estoque">
		<g:message code="prato.estoque.label" default="Estoque" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="estoque" name="estoque.id" from="${restaurantetcfome.Estoque.list()}" optionKey="id" required="" value="${pratoInstance?.estoque?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: pratoInstance, field: 'itens', 'error')} ">
	<label for="itens">
		<g:message code="prato.itens.label" default="Itens" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${pratoInstance?.itens?}" var="i">
    <li><g:link controller="itemPedido" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="itemPedido" action="create" params="['prato.id': pratoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'itemPedido.label', default: 'ItemPedido')])}</g:link>
</li>
</ul>


</div>

