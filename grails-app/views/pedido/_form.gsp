<%@ page import="restaurantetcfome.Pedido" %>



<div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'valorTotal', 'error')} required">
	<label for="valorTotal">
		<g:message code="pedido.valorTotal.label" default="Valor Total" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="valorTotal" value="${fieldValue(bean: pedidoInstance, field: 'valorTotal')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'cliente', 'error')} required">
	<label for="cliente">
		<g:message code="pedido.cliente.label" default="Cliente" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cliente" name="cliente.id" from="${restaurantetcfome.Cliente.list()}" optionKey="id" required="" value="${pedidoInstance?.cliente?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'dataHora', 'error')} required">
	<label for="dataHora">
		<g:message code="pedido.dataHora.label" default="Data Hora" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataHora" precision="day"  value="${pedidoInstance?.dataHora}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'itens', 'error')} ">
	<label for="itens">
		<g:message code="pedido.itens.label" default="Itens" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${pedidoInstance?.itens?}" var="i">
    <li><g:link controller="itemPedido" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="itemPedido" action="create" params="['pedido.id': pedidoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'itemPedido.label', default: 'ItemPedido')])}</g:link>
</li>
</ul>


</div>

