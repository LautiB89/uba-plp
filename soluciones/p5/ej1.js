// Ejercicio 2

const t = {
    ite(a, b) {
        return a;
    },
    mostrar() {
        console.log("Verdadero");
    },

    not() {
        return f;
    },

    and(p) {
        return p;
    }
}

const f = {
    ite(a, b) {
        return b;
    },
    
    mostrar() {
        console.log("False");
    },
    
    not() {
        return t;
    },
   
    and(_) {
        return this;
    }
}

t.and(f)
