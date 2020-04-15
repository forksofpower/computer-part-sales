# users
user1 = User.create(name: "Patrick", email: "p@gmail.com")
user2 = User.create(name: "Tsura", email: "t@gmail.com")

# parts
part1 = Part.create({
    name: 'Nvidia Geforce 2080 TI',
    manufacturer: 'EVGA',
    description: 'Super sick graphics card',
    model: 'ex-097098324',
    category: 'graphics card',
    user: User.find(1)
})

cart = Cart.new
cart.parts << part1

cart.user = user1
cart.save