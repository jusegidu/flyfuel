# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
GasStation.create([{ id: 1, name: "Ayurá", address: "Guayabal con la 80", latitud: '24° N', longitud: '34° S' }])
puts "Gas Station created"
