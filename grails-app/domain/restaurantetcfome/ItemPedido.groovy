package restaurantetcfome

class ItemPedido {

    Integer quantidade
    Double valorVenda
    String observacao

    Produto produto
    Pedido pedido

    //estou salvando os itens do Pedido, pois o itensPedido pertence ao Pedido
    static belongsTo = [Pedido]

    static constraints = {
    }

    static mapping = {
        produto column: "id_produto"
        pedido column: "id_pedido"
    }
}
