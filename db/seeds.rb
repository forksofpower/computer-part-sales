# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# users
user = User.create(name: "Patrick", email: "p@gmail.com")
# User.create(name: "Tsura", email: "t@gmail.com")

# parts
part = Part.create({
    name: 'Nvidia Geforce 2080 TI',
    manufacturer: 'EVGA',
    description: 'Super sick graphics card',
    model: 'ex-097098324',
    quality: 'fair',
    category: 'graphics card',
    price: '450.00',
    available: true
})

cart = Cart.new
cart.parts << part

cart.user = user
cart.save