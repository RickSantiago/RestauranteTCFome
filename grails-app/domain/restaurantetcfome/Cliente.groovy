package restaurantetcfome

class Cliente {

    String nome
    String email
    String senha

    //relacionamento de muitos para muitos
    static hasMany = [pedido:Pedido, produtoPreferidos:Produto]

    static constraints = {
    }

    //mapeamento da tabela renomeando a table auxiliar
    static mapping = {
        produtoPreferidos joinTable: [name:"preferencias_clientes", key:"id_cliente", column: "id_produto"]
    }
}

