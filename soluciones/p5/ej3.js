let cero1 = {    

    toNumber() {
        return 0;
    },

    esCero() {
        return true;
    },

    succ() {
        let o = Object.create(this);

        o.toNumber = function() {
            // tambien podría usar getPrototypeOf
            return o.pred().toNumber() + 1;
        }
        o.esCero = function() {
            return false;
        }
        o.pred = function() {
            let ret = Object.getPrototypeOf(this);
            return ret;
        }
        return o;
    }
}

let cero = {    
    __num__: 0,

    toNumber() {
        return this.__num__;
    },

    for(f) {
        if (!this.esCero()) {
            this.pred().for(f);
            f.eval(this);
        }
        /*
        const n = this.toNumber()
         for (let i = 0; i < n; i++) {
            f(i)
        } 
        */
    },

    esCero() {
        return true;
    },

    succ() {
        let o = Object.create(this);
        o.__num__ += 1              // o.num es copia de this.num y es un atributo de o (no heredado)
        o.esCero = function() {
            return false;
        }
        o.pred = function() {
            let ret = Object.getPrototypeOf(this);
            return ret;
        }
        return o;
    }
}

const uno = cero.succ();
const dos = uno.succ();
