puts "🌱 Seeding spices..."

# Seed your database here
d1 = Day.create(day_of_week: "Monday")
d2 = Day.create(day_of_week: "Tuesday")
d3 = Day.create(day_of_week: "Wednesday")
d4 = Day.create(day_of_week: "Thursday")
d5 = Day.create(day_of_week: "Friday")
d6 = Day.create(day_of_week: "Saturday")
d7 = Day.create(day_of_week: "Sunday")

t1 = Task.create(name: 'Wash the dishes', day_id: d1.id)
t2 = Task.create(name: 'Water the plants', day_id: d2.id)

puts "✅ Done seeding!"
