#import "vantage-typst.typ": skill, styled-link, term, vantage
#let configuration = yaml("configuration.yaml")

#vantage(
  name: configuration.contacts.name,
  position: configuration.position,
  links: (
    (name: "email", link: "mailto:" + configuration.contacts.email),
    (name: "github", link: configuration.contacts.github.url, display: configuration.contacts.github.displayText),
    (name: "linkedin", link: configuration.contacts.linkedin.url, display: configuration.contacts.linkedin.displayText),
    (name: "globe", link: configuration.contacts.website.url, display: configuration.contacts.website.displayText),
    (name: "location", link: "https://maps.app.goo.gl/p16RDniPMHJk5hg26", display: configuration.contacts.address),
  ),
  tagline: "Machine learning student (MSc from NISER), Physics major & CS minor, driven by fundamental questions in model optimization. I apply principles from physics and algorithmic theory to develop efficient, scalable AI for complex scientific challenges.",
  [

    #include "projects_phd.typ"

  ],
  [

    == RESEARCH OBJECTIVE

    To apply advanced machine learning and computational methods to solve complex physics problems.

    == PUBLICATIONS
    #bibliography("pub.bib", full: true, title: none, style: "american-physics-society")
    // #bibliography("pub.bib", full: true, title: none, style: "trends")

    #if "achievements" in configuration [
      == ACHIEVEMENTS

      #for achievement in configuration.achievements [
        === #achievement.name
        \
        #achievement.description
      ]
    ]

    #if "education" in configuration [
      == EDUCATION

      #for edu in configuration.education [
        === #if edu.place.link != "" [
          #link(edu.place.link)[#edu.place.name]\
        ] else [
          #edu.place.name\
        ]
        #edu.degree #h(1fr) #edu.marks\
        | #edu.from - #edu.to | #for point in edu.points [ #point | ]
      ]
    ]

    #if "skills" in configuration [
      == SKILLS
      #for skill in configuration.skills [
        #skill,
      ]
    ]

    #if "tools" in configuration [
      == TOOLS

      #for tool in configuration.tools [
        • #tool
      ]
    ]

  ],
)
