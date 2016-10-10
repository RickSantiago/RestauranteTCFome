package restaurantetcfome

class Prato extends Produto {

    Integer quantidadePessoas

    static constraints = {
        quantidadePessoas min: 1
    }
}

