
function primero() {
    let o1 = { x:1 };
    let o2 = Object.create(o1); 
    //debería tener prototype=o1
    Object.getPrototypeOf(o2).y = 2; 
    //agrega el atributo y a o1
    console.log(o1.y)
}

function segundo() {
    let o1 = { x: 1 };
    let o2 = { y: 2 };
    Object.getPrototypeOf(o1).z = 3; 
    //agrega el atributo y al proto de o1
    console.log(o2.z) 
    //no debería tener esto
    //PERO LO TIENE
    //el prototipo de o1 es el prototipo padre (Object)
    //los cambios que hagamos acá influyen en todos
    // este prototipo esta arriba de todas las cadenas
}