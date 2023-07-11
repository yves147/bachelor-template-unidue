#let eidesversicherung(today_str: "") = [
  #text(size: 16pt)[*Versicherung an Eides Staat*]

  #v(20pt)
  
    Ich versichere an Eides statt durch meine untenstehende Unterschrift,
  - dass ich die vorliegende Arbeit - mit Ausnahme der Anleitung durch die Betreuer
  - selbstständig ohne fremde Hilfe angefertigt habe und
  - dass ich alle Stellen, die wörtlich oder annähernd wörtlich aus fremden Quellen entnommen sind, entsprechend als Zitate gekennzeichnet habe und
  - dass ich ausschließlich die angegebenen Quellen (Literatur, Internetseiten, sonstige Hilfsmittel) verwendet habe und
  - dass ich alle entsprechenden Angaben nach bestem Wissen und Gewissen vorge- nommen habe, dass sie der Wahrheit entsprechen und dass ich nichts verschwiegen habe.
  Mir ist bekannt, dass eine falsche Versicherung an Eides Statt nach §156 und §163 Abs.
  1 des Strafgesetzbuches mit Freiheitsstrafe oder Geldstrafe bestraft wird.

  #v(230pt)
  
  #stack(
    dir: ltr,
    box(
      stack(
        dir: ttb,
        text(size: 11pt)[Duisburg, #today_str],
        v(5pt),
        line(length: 130pt, stroke: ( thickness: 0.3pt )),
        v(5pt),
        text(size: 11pt)[(Ort, Datum)]
      )
    ),
    h(100pt),
    box(
      stack(
        dir: ttb,
        v(12.25pt),
        line(length: 160pt, stroke: ( thickness: 0.3pt )),
        v(5pt),
        text(size: 11pt)[(Vorname Nachname)]
      )
    ),
  )
]

#let de_month(month: 0) = {
  let months = ("0": "Januar", "1": "Februar", "2": "März", "3": "April", "4": "Mai", "5": "Juni", "6": "Juli", "7": "August", "8": "September", "9": "Oktober", "10": "November", "11": "Dezember")
  return months.at(str(month))
}

#let uniduevsbsc(
  title: "Paper Title",
  author: (),
  abstract: none,
  index-terms: (),
  paper-size: "a4",
  numbering-config: (
    start: 7,
    abstract: 3,
    tableofcontents: 5
  ),
  end_listings: (
    math: false,
    figures: false
  ),
  bibliography-file: none,
  versicherung: true,
  body
) = {
  set document(title: title, author: author.name)

  set text(size: 12pt)

  set page(
    paper: paper-size,
    footer: [
      #locate(loc => [
        #let i = loc.page()
        #let al = left

        //#counter(page).final(loc).first();
        #if versicherung and i == counter(page).final(loc).first() + numbering-config.start - 1 {
          return " "
        }

        #if calc.rem(i, 2) == 0 {
          al = right
        }

        #let val = ""
        #if i < numbering-config.start {
          if i == numbering-config.abstract or i == numbering-config.tableofcontents {
            al = right
            val = numbering("I", i)
          }
        } else {
          val = str(i - numbering-config.start + 1)
        }

        #if val == "" {
          return " "
        }
        
        #set align(al)
        #set text(8pt)
        
        #stack(dir: ttb,
          spacing: 3pt,
          line(length: 100%, stroke: ( thickness: 0.3pt )),
          text(size: 9pt)[#val]
        )
      ])
    ],
  )

  show outline.entry.where(
    level: 1
  ): it => {
    v(12pt, weak: true)
    strong(it)
  }

  set math.equation(numbering: "(1)")
  show math.equation: set block(spacing: 0.65em)

  set enum(indent: 10pt, body-indent: 9pt)
  set list(indent: 10pt, body-indent: 9pt)

  set heading(numbering: "1.1.1.")
  show heading: it => locate(loc => {
    let levels = counter(heading).at(loc)
    let deepest = if levels != () {
      levels.last()
    } else {
      1
    }
    let levelstr = levels.map(a => str(a)).join(".")

    set text(11pt, weight: 400)
    if it.level == 1 [
      #let is-ack = it.body in ([Acknowledgment], [Acknowledgement])
      #set align(left)
      /*#set text(if is-ack { 10pt } else { 12pt })
      #show: smallcaps*/
      #pagebreak()
      #v(20pt, weak: true)
      #stack(
        spacing: 14pt,
        if it.numbering != none and not is-ack {
          text(size: 22pt)[Chapter #levelstr]
        },
        text(size: 22pt, weight: "bold")[#it.body],
      )
      #v(30pt)
    ] else if it.level == 2 [
      #set par(first-line-indent: 0pt)
      //#set text(style: "italic")
      #v(20pt)
      #stack(
        dir: ltr,
        spacing: 14pt,
        if it.numbering != none {
          text(size: 16pt, weight: "bold")[#levelstr]
          h(7pt, weak: true)
        },
        text(size: 16pt, weight: "bold")[#it.body]
      )
      #v(20pt)
    ] else [
      #if it.level == 3 {
        numbering("1)", deepest)
        [ ]
      }
      #text(size: 22pt, weight: "bold")[#it.body],
    ]
  })

  v(20pt)
  
  stack(dir: ltr, 
    spacing:8pt,
    box(width: 10pt),
    stack(dir:ttb, box(height:16pt), square(fill: black, size: 13pt)),
    stack(dir:ttb,
    spacing:8pt,
      align(left, text(15pt, weight: 800)[UNIVERSITÄT DUISBURG-ESSEN]),
      align(left, text(15pt, weight: 400)[FAKULTÄT FÜR INGENIEURWISSENSCHAFTEN]),
      align(left, text(12pt, weight: 100)[ABTEILUNG INFORMATIK UND ANGEWANDTE KOGNITIONSWISSENSCHAFT]),
    ))
    
  v(120pt, weak: true)
  
  grid(columns: (50pt, 100%),
    rows: 150pt,
    hide(box()),
    stack(dir: ttb,
      align(left, text(12pt, weight: "bold")[Bachelorarbeit]),
      v(20pt),
      align(left, text(15pt, weight: "bold")[#title]),
    v(48pt),
    stack(dir: ttb, spacing: 7pt,
      align(left, text(10pt)[
        #author.name
      ]),
      align(left, text(10pt)[Matrikelnummer:
        #author.matrikelnummer
      ]),
      align(left, text(10pt)[Angewandte Informatik (Bachelor)]),
    )
    )
  )
  
  v(80pt)
  
  let today = datetime.today()
  let today_str = today.display("[day]. ") + de_month(month: today.month()) + today.display(" [year]")

  grid(
    columns: (50%, 50%),
    rows: 240pt,
    hide(box()),
    stack(dir: ttb,
      image("images/unilogo.png", width: 100%),
      v(6pt),
      stack(dir: ttb, 
        spacing: 6pt,
        align(right, text(10pt)[Fachgebiet Verteilte Systeme, Abteilung Informatik]),
        align(right, text(10pt)[Fakultät für Ingenieurwissenschaften]),
        align(right, text(10pt)[Universität Duisburg-Essen]),
        v(2pt),
        align(right, text(10pt)[
          #today_str
        ]),
        v(46pt),
        align(left, text(10pt)[*Erstgutachter*: Prof. Dr-Ing. Torben Weis]),
        align(left, text(10pt)[*Zweitgutachter*: Hier Zweitgutachter eintragen]),
        align(left, text(10pt)[*Zeitraum*: 1. Januar 2042 - 42. März 2042]),
      )
    )
  )

  pagebreak()
  pagebreak()

  set page (
    margin: (x: 82.5pt, y: 140.51pt),
  )

  //show: columns.with(2, gutter: 12pt)
  set par(justify: true)
  show par: set block(spacing: 0.65em)
  text(size: 22pt, weight: "bold", lang: "en")[
    Abstract
  ]
  v(20pt)
  par(justify: true, first-line-indent: 0pt)[
    #abstract
  ]
  pagebreak()
  
  v(20pt)
  par(justify: true, first-line-indent: 0pt)[
    #outline(indent: auto)
  ]

  pagebreak()
  
  counter(page).update(0);

  body

  if bibliography-file != none {
    pagebreak()
    text(size: 17pt, weight: "bold", lang: "en")[
      Bibliography
    ]
    v(20pt)
    show bibliography: set text(8pt)
    bibliography(bibliography-file, title: none, style: "ieee")
  }

  if versicherung {
    pagebreak()
    eidesversicherung(today_str: today_str)
  }
}
