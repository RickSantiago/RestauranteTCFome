package restaurantetcfome

class Pedido {

    Date dataHora
    Double valorTotal
    Cliente cliente

    static constraints = {
    }

    static hasMany = [itens: ItemPedido]

    static mapping = {
        cliente column: "id_cliente"
    }
}

