let a = {
    v: () => 1,
    f: function(x) {
        return this.v() + x;
    },
};
let b = Object.create(a);
// a es el prototipo de b
// b puede responder a v, f
let c = { v: () => 2 };
Object.assign(b, c);
// copia los atributos y métodos propios (no heredados)
// de c en b, asi que ahora b tiene su propio v
console.log(b.f(3));
/* 
no se si v está definido raro 
(deberíamos invocar el método v, no llamarlo como atributo)

b.f(3) envia el mensaje f a b, que llama a this.v
eso envia el mensaje v a b
b tiene el método v copiado desde c
finalmente:
b.f(3) = this.v + 3 = 2 + 3 = 5
*/

