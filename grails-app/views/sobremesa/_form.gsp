<%@ page import="restaurantetcfome.Sobremesa" %>



<div class="fieldcontain ${hasErrors(bean: sobremesaInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="sobremesa.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${sobremesaInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: sobremesaInstance, field: 'preco', 'error')} required">
	<label for="preco">
		<g:message code="sobremesa.preco.label" default="Preco" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="preco" value="${fieldValue(bean: sobremesaInstance, field: 'preco')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: sobremesaInstance, field: 'calorias', 'error')} required">
	<label for="calorias">
		<g:message code="sobremesa.calorias.label" default="Calorias" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="calorias" type="number" min="0" value="${sobremesaInstance.calorias}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: sobremesaInstance, field: 'clientes', 'error')} ">
	<label for="clientes">
		<g:message code="sobremesa.clientes.label" default="Clientes" />
		
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: sobremesaInstance, field: 'estoque', 'error')} required">
	<label for="estoque">
		<g:message code="sobremesa.estoque.label" default="Estoque" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="estoque" name="estoque.id" from="${restaurantetcfome.Estoque.list()}" optionKey="id" required="" value="${sobremesaInstance?.estoque?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: sobremesaInstance, field: 'itens', 'error')} ">
	<label for="itens">
		<g:message code="sobremesa.itens.label" default="Itens" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${sobremesaInstance?.itens?}" var="i">
    <li><g:link controller="itemPedido" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="itemPedido" action="create" params="['sobremesa.id': sobremesaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'itemPedido.label', default: 'ItemPedido')])}</g:link>
</li>
</ul>


</div>

