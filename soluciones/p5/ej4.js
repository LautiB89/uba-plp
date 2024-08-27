// Ejercicio 4

let Punto = {
    new(new_x, new_y) {
        let res = Object.create(this);
        res.x = new_x;
        res.y = new_y;
        return res;
    },

    mostrar() {
        console.log(`Punto(${this.x}, ${this.y})`)
    },
}

let PuntoColoreado = Object.create(Punto)
PuntoColoreado.color = "rojo"

PuntoColoreado.new = function(new_x, new_y, new_color) {
    // creo un punto para poder usar su constructor
    let o = Object.getPrototypeOf(this).new(new_x, new_y);
    // piso el prototipo del punto con PuntoColoreado
    Object.setPrototypeOf(o, this)
    // agrego el atributo color que antes heredaba de PuntoColoreado
    o.color = new_color;
    return o;
}

const p = Punto.new(2, 3)
const pc = PuntoColoreado.new(2, 3, "violeta")

// Todos tienen moverX