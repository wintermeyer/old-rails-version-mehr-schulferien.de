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