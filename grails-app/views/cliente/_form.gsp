<%@ page import="restaurantetcfome.Cliente" %>



<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="cliente.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${clienteInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="cliente.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${clienteInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'senha', 'error')} required">
	<label for="senha">
		<g:message code="cliente.senha.label" default="Senha" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="senha" maxlength="12" required="" value="${clienteInstance?.senha}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'cpf', 'error')} required">
	<label for="cpf">
		<g:message code="cliente.cpf.label" default="Cpf" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cpf" required="" value="${clienteInstance?.cpf}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'pedido', 'error')} ">
	<label for="pedido">
		<g:message code="cliente.pedido.label" default="Pedido" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${clienteInstance?.pedido?}" var="p">
    <li><g:link controller="pedido" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="pedido" action="create" params="['cliente.id': clienteInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'pedido.label', default: 'Pedido')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'produtoPreferidos', 'error')} ">
	<label for="produtoPreferidos">
		<g:message code="cliente.produtoPreferidos.label" default="Produto Preferidos" />
		
	</label>
	<g:select name="produtoPreferidos" from="${restaurantetcfome.Produto.list()}" multiple="multiple" optionKey="id" size="5" value="${clienteInstance?.produtoPreferidos*.id}" class="many-to-many"/>

</div>

