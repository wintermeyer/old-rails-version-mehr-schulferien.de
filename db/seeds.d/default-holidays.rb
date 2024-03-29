ActiveRecord::Base.transaction do
  Holiday.create([
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
end
