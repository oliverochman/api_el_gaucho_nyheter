# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# To get this in your local db run rails db:seed


articles = Article.create(
  [
    {
      title: "Ny studie: Möjligt att utplåna fattigdomen och samtidigt rädda klimatet",
      lead: "Den "omöjliga ekvationen" går att lösa.",
      category: "news",
      content: "Det är fullt möjligt att rädda jordens klimat och utplåna fattigdomen på samma gång, hävdar brittiska forskare. Och detta utan att kasta oss tillbaka till medeltiden.",
    },
    {
      title: "Benjamin Ingrosso får matshow på TV4",
      lead: "TV4 knyter ännu en i klanen Wahlgren till sig.",
      category: "politics",
      content: "Storasyster Bianca Ingrosso, 25, sitter i "Talang"-juryn sedan flera år. Mamma Pernilla Wahlgren, 52, har precis tillkännagetts som del i expertpanelen i TV4:s nya storsatsning "Masked singer" och efter inspelningen av "Så mycket bättre" i somras står det nu klart att även lillebror Benjamin Ingrosso, 23, kommer att dyka upp mer i TV4 framöver. Förutom "Så mycket bättre" kommer han också att få ett eget program.",
    },
    {
      title: "Benjamin Ingrosso får matshow på TV4",
      lead: "TV4 knyter ännu en i klanen Wahlgren till sig.",
      category: "sports",
      content: "Storasyster Bianca Ingrosso, 25, sitter i "Talang"-juryn sedan flera år. Mamma Pernilla Wahlgren, 52, har precis tillkännagetts som del i expertpanelen i TV4:s nya storsatsning "Masked singer" och efter inspelningen av "Så mycket bättre" i somras står det nu klart att även lillebror Benjamin Ingrosso, 23, kommer att dyka upp mer i TV4 framöver. Förutom "Så mycket bättre" kommer han också att få ett eget program.",
    },
    {
      title: "Benjamin Ingrosso får matshow på TV4",
      lead: "TV4 knyter ännu en i klanen Wahlgren till sig.",
      category: "politics",
      content: "Storasyster Bianca Ingrosso, 25, sitter i "Talang"-juryn sedan flera år. Mamma Pernilla Wahlgren, 52, har precis tillkännagetts som del i expertpanelen i TV4:s nya storsatsning "Masked singer" och efter inspelningen av "Så mycket bättre" i somras står det nu klart att även lillebror Benjamin Ingrosso, 23, kommer att dyka upp mer i TV4 framöver. Förutom "Så mycket bättre" kommer han också att få ett eget program.",
    },
  ]
)