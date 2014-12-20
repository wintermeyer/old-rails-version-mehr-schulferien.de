# Create Germany with all FederalStates
#
germany = Country.create(name: "Deutschland", url_prefix: 'de')

germany.federal_states.create([
  { name: "Baden-Württemberg" },
  { name: "Bayern" },
  { name: "Berlin" },
  { name: "Brandenburg" },
  { name: "Bremen" },
  { name: "Hamburg" },
  { name: "Hessen" },
  { name: "Mecklenburg-Vorpommern" },
  { name: "Niedersachsen" },
  { name: "Nordrhein-Westfalen" },
  { name: "Rheinland-Pfalz" },
  { name: "Saarland" },
  { name: "Sachsen" },
  { name: "Sachsen-Anhalt" },
  { name: "Schleswig-Holstein" },
  { name: "Thüringen" }
])

Holiday.create!([
  { name: "Osterferien" },
  { name: "Pfingstferien" },
  { name: "Sommerferien" },
  { name: "Herbstferien" },
  { name: "Weihnachtsferien" },
  { name: "Winterferien" },
  { name: "Neujahr" },
  { name: "Heilige Drei Könige" },
  { name: "Karfreitag" },
  { name: "Ostermontag" },
  { name: "Tag der Arbeit" },
  { name: "Christi Himmelfahrt" },
  { name: "Pfingstmontag" },
  { name: "Fronleichnam" },
  { name: "Tag der Deutschen Einheit" },
  { name: "Allerheiligen" },
  { name: "1. Weihnachtsfeiertag" },
  { name: "2. Weihnachtsfeiertag" },
  { name: "Maria Himmelfahrt" },
  { name: "Reformationstag" },
  { name: "Buss- und Bettag" }
  ])
