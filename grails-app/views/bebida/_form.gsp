<%@ page import="restaurantetcfome.Bebida" %>



<div class="fieldcontain ${hasErrors(bean: bebidaInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="bebida.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${bebidaInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: bebidaInstance, field: 'preco', 'error')} required">
	<label for="preco">
		<g:message code="bebida.preco.label" default="Preco" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="preco" value="${fieldValue(bean: bebidaInstance, field: 'preco')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: bebidaInstance, field: 'liquido', 'error')} required">
	<label for="liquido">
		<g:message code="bebida.liquido.label" default="Liquido" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="liquido" value="${fieldValue(bean: bebidaInstance, field: 'liquido')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: bebidaInstance, field: 'unidade', 'error')} required">
	<label for="unidade">
		<g:message code="bebida.unidade.label" default="Unidade" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="unidade" from="${bebidaInstance.constraints.unidade.inList}" required="" value="${bebidaInstance?.unidade}" valueMessagePrefix="bebida.unidade"/>

</div>

<div class="fieldcontain ${hasErrors(bean: bebidaInstance, field: 'clientes', 'error')} ">
	<label for="clientes">
		<g:message code="bebida.clientes.label" default="Clientes" />
		
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: bebidaInstance, field: 'estoque', 'error')} required">
	<label for="estoque">
		<g:message code="bebida.estoque.label" default="Estoque" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="estoque" name="estoque.id" from="${restaurantetcfome.Estoque.list()}" optionKey="id" required="" value="${bebidaInstance?.estoque?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: bebidaInstance, field: 'itens', 'error')} ">
	<label for="itens">
		<g:message code="bebida.itens.label" default="Itens" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${bebidaInstance?.itens?}" var="i">
    <li><g:link controller="itemPedido" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="itemPedido" action="create" params="['bebida.id': bebidaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'itemPedido.label', default: 'ItemPedido')])}</g:link>
</li>
</ul>


</div>

