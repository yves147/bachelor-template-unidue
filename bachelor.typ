#import "template.typ": *

#show: uniduevsbsc.with(
  title: "Bachelor Example Template",
  abstract: [
    The process of scientific writing is often tangled up with the intricacies of typesetting, leading to frustration and wasted time for researchers. In this paper, we introduce Typst, a new typesetting system designed specifically for scientific writing. Typst untangles the typesetting process, allowing researchers to compose papers faster. In a series of experiments we demonstrate that Typst offers several advantages, including faster document creation, simplified syntax, and increased ease-of-use.
  ],
  author: (
      name: "Max Mustermann",
      matrikelnummer: "01234567"
  ),
  index-terms: ("Scientific writing", "Typesetting", "Document creation", "Syntax"),
  bibliography-file: "refs.bib",
)

= Introduction
Scientific writing is a crucial part of the research process, allowing researchers to share their findings with the wider scientific community. However, the process of typesetting scientific documents can often be a frustrating and time-consuming affair, particularly when using outdated tools such as LaTeX. Despite being over 30 years old, it remains a popular choice for scientific writing due to its power and flexibility. However, it also comes with a steep learning curve, complex syntax, and long compile times, leading to frustration and despair for many researchers. @netwok2020

== Paper overview
In this paper we introduce Typst, a new typesetting system designed to streamline the scientific writing process and provide researchers with a fast, efficient, and easy-to-use alternative to existing systems. Our goal is to shake up the status quo and offer researchers a better way to approach scientific writing.

By leveraging advanced algorithms and a user-friendly interface, Typst offers several advantages over existing typesetting systems, including faster document creation, simplified syntax, and increased ease-of-use.

To demonstrate the potential of Typst, we conducted a series of experiments comparing it to other popular typesetting systems, including LaTeX. Our findings suggest that Typst offers several benefits for scientific writing, particularly for novice users who may struggle with the complexities of LaTeX. Additionally, we demonstrate that Typst offers advanced features for experienced users, allowing for greater customization and flexibility in document creation.

Overall, we believe that Typst represents a significant step forward in the field of scientific writing and typesetting, providing researchers with a valuable tool to streamline their workflow and focus on what really matters: their research. In the following sections, we will introduce Typst in more detail and provide evidence for its superiority over other typesetting systems in a variety of scenarios.

= Methods
#lorem(90)

$ a + b = gamma $

#lorem(200)

= Including Examples
#lorem(26)

== Code
You can use `Rust` code.

```rust
fn main() {
    println!("Hello World!");
}
```

#underline[This is valid C++ Code:]
```cpp
struct X
<%
    compl X() <%%> // destructor
    X() <%%>
    X(const X bitand) = delete; // copy constructor
 
    bool operator not_eq(const X bitand other)
    <%
       return this not_eq bitand other;
    %>
%>;
int main(int argc, char* argv<::>) 
<%
    auto greet = <:bitand:>(const char* name)
    <%
        std::cout << "Hello " << name
                  << " from " << argv<:0:> << '\n';
    %>;
    if (argc > 1 and argv<:1:> not_eq nullptr)
        greet(argv<:1:>);
%>
```

== Images
#figure(caption: "Hallo")[#image("images/startrek.png", width: 200pt)] <figur1>

#grid(columns: (50%, 50%), gutter: 10pt, rows: 100pt,
  lorem(50),
  figure(caption: "Hallo")[
    #image("images/startrek.png", width: 200pt)
  ]
)

#pagebreak()

== Further Grids
#grid(
  columns: (100pt, 50pt, 70pt), rows: (20pt, 40pt, 60pt),
  rect(width: 100%), rect(width: 100%), rect(width: 100%),
  rect(width: 100%), rect(width: 100%, height: 100%), rect(height: 100%, fill: rgb("ff0000")),
  rect(width: 100%)[#text[Hallo]], rect(width: 100%), rect(width: 100%),
)

== Managing References
#lorem(100) Hier findet man die obere Figur: @figur1

Also: Google #footnote("https://google.com")

#include("math.typ")

= Documentation
You can find any further information #underline(link("https://typst.app/docs/")[on typst.app/docs])
