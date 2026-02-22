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
