<%@ page import="restaurantetcfome.ItemPedido" %>



<div class="fieldcontain ${hasErrors(bean: itemPedidoInstance, field: 'quantidade', 'error')} required">
	<label for="quantidade">
		<g:message code="itemPedido.quantidade.label" default="Quantidade" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantidade" type="number" min="0" value="${itemPedidoInstance.quantidade}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemPedidoInstance, field: 'valorVenda', 'error')} required">
	<label for="valorVenda">
		<g:message code="itemPedido.valorVenda.label" default="Valor Venda" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="valorVenda" value="${fieldValue(bean: itemPedidoInstance, field: 'valorVenda')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemPedidoInstance, field: 'observacao', 'error')} ">
	<label for="observacao">
		<g:message code="itemPedido.observacao.label" default="Observacao" />
		
	</label>
	<g:textField name="observacao" value="${itemPedidoInstance?.observacao}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemPedidoInstance, field: 'pedido', 'error')} required">
	<label for="pedido">
		<g:message code="itemPedido.pedido.label" default="Pedido" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="pedido" name="pedido.id" from="${restaurantetcfome.Pedido.list()}" optionKey="id" required="" value="${itemPedidoInstance?.pedido?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemPedidoInstance, field: 'produto', 'error')} required">
	<label for="produto">
		<g:message code="itemPedido.produto.label" default="Produto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="produto" name="produto.id" from="${restaurantetcfome.Produto.list()}" optionKey="id" required="" value="${itemPedidoInstance?.produto?.id}" class="many-to-one"/>

</div>

