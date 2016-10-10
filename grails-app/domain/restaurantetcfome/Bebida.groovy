package restaurantetcfome

class Bebida extends Produto {

    Double liquido
    String unidade

    static constraints = {
        liquido min: new Double(0)
        unidade nullable: false, blank: false, inList: ["Litro(Lt)", "MiliLitro(Ml)"]
    }
}
