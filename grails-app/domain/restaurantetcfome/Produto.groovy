package restaurantetcfome

class Produto {

    String nome
    Double preco
    Estoque estoque

    //relacionamento de muitos para muitos
    static hasMany = [clientes: Cliente, itens: ItemPedido]

    //estou dizendo que o Produto pertence ao objeto Cliente
    static belongsTo = [Cliente]

    static constraints = {
        nome blank: false, nullable: false
        preco min: new Double(0)
    }

    //mapeando e renomeando chave da tabela estoque e da tabela auxiliar preferencia_clientes
    static mapping = {
        estoque column: "id_estoque"
        clientes joinTable: [name:"preferencias_clientes", key:"id_produto", column: "id_cliente"]

    }
}
