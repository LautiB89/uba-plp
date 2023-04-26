
module.exports = {
  macros: {
    "\\true": "\\sf{true}",
    "\\false": "\\sf{false}",
    "\\bool": "\\sf{Bool}",
    "\\num": "\\underline{#1}",
    "\\succ": "\\sf{succ}({#1})",
    "\\pred": "\\sf{pred}({#1})",
    "\\iszero": "\\sf{isZero}({#1})",
    "\\asign": "\\{{#1}\\leftarrow{#2}\\}",
    "\\nat": "\\sf{Nat}",
    "\\if": "\\sf{if }{#1}\\sf{ then }{#2}\\sf{ else }{#3}",
    "\\lda": "\\lambda {#1} : {#2} . \\ {#3}",
    "\\fix": "\\sf{fix}\\ ",
    "\\deriv": "\\frac{#2}{#1}(\\text{#3})",
    "\\t":"\\vdash",
  }
}