package restaurantetcfome

class Cliente {

    String nome
    String email
    String senha

    static hasMany = [pedido:Pedido]

    static constraints = {
    }
}

