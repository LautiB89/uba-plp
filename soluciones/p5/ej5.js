// Punto

function Punto(x, y) {
    this.x = x;
    this.y = y;
}

Punto.prototype.mostrar = function() {
    console.log(`Punto(${this.x}, ${this.y})`)
}

// Punto Coloreado

function PuntoColoreado(x, y, color) {
    Punto.call(this, x, y); // Llama a Punto usando ligando su this al this actual
    this.color = color;
}

Object.setPrototypeOf(PuntoColoreado.prototype, Punto.prototype)

// Pruebas

let p = new Punto(2, 3)
let pc = new PuntoColoreado(2, 3, "rojo")
