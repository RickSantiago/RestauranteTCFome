package restaurantetcfome

class Cliente {

    String nome
    String cpf
    String email
    String senha

    //relacionamento de muitos para muitos
    static hasMany = [pedido:Pedido, produtoPreferidos:Produto]

    static constraints = {
        nome nullable: false, blank: false
        email email: true, unique: true
        senha size: 6..12

        cpf validator: {
            valor, objeto ->
                (valor.size() == 11)

        }
    }

    //mapeamento da tabela renomeando a table auxiliar
    static mapping = {
        produtoPreferidos joinTable: [name:"preferencias_clientes", key:"id_cliente", column: "id_produto"]
    }
}

