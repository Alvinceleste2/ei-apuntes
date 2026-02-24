#import "@local/chuletario:1.0.0": conf

#import "@preview/theorion:0.4.1": *
#import cosmos.rainbow: *
#show: show-theorion

// 1. Change the counters and numbering:
#set-inherited-levels(1)
#set-zero-fill(true)
#set-leading-zero(true)
#set-theorion-numbering("1.1")

// 2. Other options:
// #set-result("noanswer") // Deletes the demos.
// #set-qed-symbol[#math.qed] // Changes qed symbol for proofs.

// Prevents theorem boxes from breaking (also definitions, lemmas, ... and so on)
#show figure: set block(breakable: false)

// Makes corollary numbering same as the rest of objects.
#let (corollary-counter, corollary-box, corollary, show-corollary) = make-frame(
  "corollary",
  theorion-i18n-map.at("corollary"),
  counter: theorem-counter,
  render: render-fn.with(fill: fuchsia.darken(10%)),
)

#show: conf.with(
  title: "Chuletario Estadística I",
  author: "Álvaro Grande Blázquez",
  course: "2025 ~ 2026",
  watermark: "AGB",
)

= Estadística descriptiva

== Estadística descriptiva e inferencia estadística

== Resúmenes numéricos de un conjunto de datos

== Herramientas gráficas para el análisis exploratorio de datos

== Datos bivariantes, correlación y recta de regresión

= Muestreo aleatorio

== Distribución en el muestreo bajo normalidad poblacional

#note-box[
  Para el caso general, $"Var"(S_(n-1)^2) = 1/n (mu_4 - sigma^4) + (2 sigma^4)/(n(n-1))$, donde $mu_4 = EE[(X - mu)^4]$
]

#definition(title: [Distribución t-Student])[
  Sea $Z ~ N(0, 1)$ y sea $Q ~$ con $k>1$.
  Además, $Z, Q$ son v.a. independientes.
  Decimos que la v.a. $T$ tiene distribución *t-Student* con $k$ grados de libertad cuando:

  $
    T = (Z)/(sqrt(Q\/k)) ~ t_k
  $
]

#property(title: [Propiedades de la distribución t-Student])[
  Sea $T$ una v.a. tal que $T ~ t_k$. Entonces:

  + Es simétrica $=> EE(T) = 0 thick forall k>1$

  + $"Var"(T) = k/(k-2) thick forall k>2$

  + $t_k -->_(k->oo) N(0, 1)$
]

#theorem[
  Sean $X_1, ..., X_n$ v.a.i.i.d. tales que $X_i ~ N(mu, sigma^2) thick forall i = 1, ..., n$.
  Entonces:

  $
    (overline(X) - mu)/(S_(n-1)\/sqrt(n)) ~ t_(n-1)
  $
]

#proof[
  Sabemos que $Z ~ (overline(X) - mu)/(sigma\/sqrt(n)) ~ N(0, 1)$ y $((n-1) S_(n-1)^2)/sigma^2 ~ chi_(n-1)^2$. Entonces:
  $
    ((overline(X) - mu)/(sigma\/sqrt(n)))/(sqrt(((n-1)S_(n-1)^2)/(sigma^2 (n-1)))) = (overline(X) - mu)/(S_(n-1)\/sqrt(n)) ~ t_(n-1)
  $
]

#lemma(title: [Lema de Ficher])[
  Sea $X_1, ..., X_n$ v.a.i.i.d. con distribución $N(mu, sigma^2)$. Entonces:

  - Los estadísticos $overline(X)$ y $S_(n-1)^2$ son v.a. independientes.

  - $((n-1)S_(n-1)^2)/sigma^2 ~ chi_(n-1)^2$

  - $(overline(X) - mu)/(S_(n-1)\/sqrt(n)) ~ t_(n-1)$

]

#note-box[
  $
    S_n^2 = (n-1)/n S_(n-1)^2 => (overline(X) - mu)/(S_(n-1) \/ sqrt(n)) = (overline(X) - mu)/(S_n \/ sqrt(n-1))
  $
]

== Aproximaciones asintóticas de las distribuciones en el muestreo

#definition(title: [Convergencia en distribución])[
  Sea ${Y_n}_(n>=1)$ una colección de v.a. con distribución $F_(Y_n) (t) = PP(Y_n <= t)$ y sea $Y$ una v.a. con distribución $F_Y (t) = PP(Y<=t)$.
  Decimos que $Y_n$ *converge en distribución* si
  $
    lim_(n->oo) F_(Y_n)(t) = F(t) quad forall t "donde" F_Y "es continua"
  $
  Se denota $Y_n stretch(->)^d Y$.
]

#note-box[
  También se cumple
  $
    Y_n -> Y <=> lim_(n->oo) EE[g(Y_n)] = EE[g(Y)] thick forall g: RR -> RR "continua y acotada"
  $
]

#proposition[
  Sea ${Y_n}$ una sucesión de v.a. y sea $Y$ v.a.. Entonces:

  + $Y_n arrow^P Y => Y_n arrow^d Y$

  + $Y_n arrow^P c <=> Y_n arrow^d c, thick c in RR$
]

#theorem(title: [de la aplicación continua para convergencia en distribución])[
  Sea ${Y_n}_(n>=1)$ una colección de v.a. y sea $Y$ otra v.a. tales que $Y_n arrow^d Y$.
  Sea $g: RR -> RR$ una función continua.
  Entonces $g(Y_n) arrow^d g(Y)$.
]

#theorem(title: [Teorema central del límite])[
  Sean $X_1, X_2, ...$ v.a.i.i.d. con $EE(X_i) = mu$ y $"Var"(X_i) = sigma^2 < oo$.
  Entonces:
  $
    (sqrt(n)(overline(X) - mu))/sigma arrow^d N(0, 1)
  $

  Equivalentemente:
  $
    sqrt(n)(overline(X) - mu) arrow^d N(0, sigma^2)
  $
]

#lemma(title: [Lema de Slutsky])[
  Sean ${X_n}_(n>=1)$ e ${Y_n}_(n>=1)$ colecciones de v.a. tales que $X_n arrow^d X$ e $Y_n arrow^d a$, donde $X$ es una v.a. y $a in RR$.
  Entonces:
  - $X_n + Y_n arrow^d X + a$

  - $X_n dot Y_n arrow^d a X$

  - $(X_n)/(Y_n) arrow^d X/a$ para $a != 0$
]

#example[
  Sea $X_1, X_2, ...$ una colección de v.a.i.i.d. tales que $EE(X_i) = mu != 0$ y $"Var"(X_i) = sigma^2 < oo, thick forall i = 1, ..., n$. Vamos a estudiar la distribución límite $sqrt(n)(overline(X)^2 - mu^2)$.

  Solución:
  $
    sqrt(n) (overline(X)^2 - mu^2) = sqrt(n)(overline(X) - mu)(overline(X) + mu)
  $

  Por el T.C.L. tenemos $sqrt(n)(overline(X)-mu) arrow^d X$, donde $X~N(0, sigma^2)$.
]

Ya vimos que $overline(X) arrow^PP mu$, ya que $overline(X)$ es un estimador consistente para $mu$.

Sea $h(x) = x + mu$ una función continua, por el teorema de la aplicación continua para la convergencia en probabilidad, se tiene
$
  overline(X) + mu arrow^PP mu + mu = 2 mu
$

Por el lema de Slutsky para el producto:
$
  sqrt(n) (overline(X)^2 - mu^2) arrow^d 2 mu X
$
donde $2 mu X ~ N(0, 4 mu^2 sigma^2)$

#theorem(title: [Método delta univariante])[
  Sea ${X_n}_(n>=1)$ una sucesión de v.a. y sea $theta in RR$.
  Sea $X$ una v.a. tal que.
  $
    n^alpha (X_n - theta) arrow^d X quad "para" alpha > 0
  $

  Sea $g: RR arrow RR$ una función derivable en $theta$, entonces:
  $
    n^alpha (g(X_n) - g(theta)) arrow^d g'(theta) X
  $
]

#example[
  Estudiar $sqrt(n) (overline(X)^2 - mu^2)$ con $mu != 0$.

  #solution[
    Por el T.C.L., $sqrt(n) (overline(X) - mu) arrow^d X$ con $X ~ N(0, sigma^2)$.
    Aquí $alpha = 1/2$.
    Consideramos la función $g(x) = x^2$, con $g'(x) = 2x$.
    Aplicando el método delta:
    $
      sqrt(n) (g(overline(X)) - g(u)) = sqrt(n) (overline(X)^2 - mu^2) arrow^d 2 mu X
    $
    donde $2 mu X ~ N(0, 4 mu^2 sigma^2)$.
  ]
]

#example[
  Estudiar la distribución límite $sqrt(n) overline(X)^2$ con $EE(X_i) = 0 = mu$.

  #solution[
    Por el T.C.L., $sqrt(n) (overline(X) - mu) = sqrt(n) overline(X) arrow^d X$ con $X ~ N(0, sigma^2)$.
    Consideramos la función $g(x) = x^2$ continua.
    Por el teorema de la aplicación continua para convergencia en distribución se obtiene:
    $
      n overline(X)^2 arrow^d X^2
    $
    Como $X~N(0, sigma^2)$, se verifica $X=sigma Z$ donde $Z~N(0, 1)$.
    Luego $X^2 = sigma^2 Z^2$ con $Z^2~chi_1^2$.
    Así, $X^2 ~ sigma^2 chi_1^2$.
    Finalmente, $n overline(X)^2 arrow^d sigma^2 chi_1^2$.
  ]
]

#v(1cm)

Por T.C.L., $sqrt(n) (overline(X) - mu) arrow^d N(0, sigma^2) <=> (sqrt(n) (overline(X) - mu))/sigma arrow^d N(0, 1)$

#theorem[
  Sea $X_1, X_2, ...$ una colección de v.a.i.i.d. con $EE(X_i)=mu$ y $"Var"(X_i) = sigma^2 < oo thick forall i = 1, ..., n$.
  Entonces se verifica:
  $
    (sqrt(n)(overline(X) - mu))/S_n arrow^d N(0, 1) quad "y" quad (sqrt(n)(overline(X) - mu))/S_(n-1) arrow^d N(0, 1)
  $
]

#proof[
  Por el T.C.L., se verifica
  $ (sqrt(n)(overline(X) - mu))/sigma arrow^d N(0, 1) $

  Ya vimos que $S_n^2 arrow^PP sigma^2$ y $S_(n-1)^2 arrow^PP sigma^2$.
  Sea $g(x) = sqrt(x)$ continua en $x >= 0$.
  Aplicando el teorema de la aplicación continua para convergencia en probabilidad, se obtiene:

  $
    S_n arrow^PP sigma quad "y" quad S_(n-1) arrow^PP sigma
  $

  Así,
  $ sigma/S_n arrow^PP 1 quad "y" quad sigma/S_(n-1) arrow^PP 1 $

  Ahora, por el lema de Slutsky:
  $ (sqrt(n) (overline(X) - mu))/S_n = (sqrt(n)(overline(X) - mu))/sigma dot sigma/S_n arrow^d N(0, 1) $
]

#note-box[
  Como $sqrt((n)/(n-1)) arrow.long^1_(n arrow oo) 1.$
  Por tanto, $(S_(n-1))/S_n arrow^PP 1$

  Equivalencia asintótica entre $S_(n-1)$ y $S_n$.
]
