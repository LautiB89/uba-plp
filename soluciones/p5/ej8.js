
function C1() {};
C1.prototype.g = "Hola";

function C2() {};
C2.prototype.g = "Mundo";

let a = new C2 ();          // a tiene prototipo C2
let b = new C1 ();          // b tiene prototipo C1
let c = Object.create(a);   // c tiene prototipo a
// a = b ;
// C2.prototype.g = C1.prototype.g;
Object.setPrototypeOf(a, b);

console.log(a.g) //Hola
console.log(c.g) //Mundo

// cuando usamos objetos en realidad nuestras variables
// guardan referencias a estos

// hacer a=b hace que a y b apunten al mismo obj en memoria
// el obj que antes apuntaba a, sigue existiendo y es el prototype de c

// Si reemplazamos a=b por C2.prototype.g = C1.prototype.g
// dice Hola Hola en vez de Hola Mundo
// hicimos que C2 tenga el g de C1, 
//  asi que ahora todos muestran "Hola"

// Si reemplazamos a=b por Object.setPrototypeOf(a, b)
// dice Hola Hola en vez de Hola Mundo
// hicimos que a como prototipo a b, 
//  ahora la cadena de prototipos es:
// a --> b --> C1 --> prototype (este tiene g = "Hola")
