package restaurantetcfome

class Produto {

    String nome
    Double preco
    Estoque estoque

    static constraints = {

    }

    static mapping = {
        estoque column: "id_estoque"
    }
}
