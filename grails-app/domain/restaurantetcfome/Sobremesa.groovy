package restaurantetcfome

class Sobremesa extends Produto {

    Integer calorias

    static constraints = {
        calorias min: 0
    }
}
