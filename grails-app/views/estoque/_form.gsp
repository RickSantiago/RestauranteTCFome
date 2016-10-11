<%@ page import="restaurantetcfome.Estoque" %>



<div class="fieldcontain ${hasErrors(bean: estoqueInstance, field: 'quantidade', 'error')} required">
	<label for="quantidade">
		<g:message code="estoque.quantidade.label" default="Quantidade" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantidade" type="number" min="0" value="${estoqueInstance.quantidade}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: estoqueInstance, field: 'quantidadeMinima', 'error')} required">
	<label for="quantidadeMinima">
		<g:message code="estoque.quantidadeMinima.label" default="Quantidade Minima" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantidadeMinima" type="number" min="0" value="${estoqueInstance.quantidadeMinima}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: estoqueInstance, field: 'produto', 'error')} required">
	<label for="produto">
		<g:message code="estoque.produto.label" default="Produto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="produto" name="produto.id" from="${restaurantetcfome.Produto.list()}" optionKey="id" required="" value="${estoqueInstance?.produto?.id}" class="many-to-one"/>

</div>

