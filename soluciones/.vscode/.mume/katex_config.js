
module.exports = {
  macros: {
    "\\true": "\\text{true}",
    "\\false": "\\text{false}",
    "\\bool": "\\text{Bool}",
    "\\num": "\\underline{#1}",
    "\\succ": "\\text{succ}({#1})",
    "\\pred": "\\text{pred}({#1})",
    "\\iszero": "\\text{isZero}({#1})",
    "\\asign": "\\{{#1}\\leftarrow{#2}\\}",
    "\\nat": "\\text{Nat}",
    "\\if": "\\text{if }{#1}\\text{ then }{#2}\\text{ else }{#3}",
    "\\lda": "\\lambda{#1}:{#2}.\\ {#3}",
    "\\deriv": "\\frac{#2}{#1}(\\text{#3})",
    "\\t":"\\vdash",
  }
}