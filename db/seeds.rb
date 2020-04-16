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
part2 = Part.create({
    name: 'GTX 550 TI',
    manufacturer: 'Asus',
    description: 'Fairly old and shitty graphics card',
    model: 'engtx550 ti dc/di/1gd5',
    category: 'graphics card',
    user: User.find(2)
})

listing1 = Listing.create({
    part: part1,
    user: user1,
    price: 750.00,
    condition: 'new'
})

listing2 = Listing.create({
    part: part2,
    user: user2,
    price: 75.00,
    condition: 'fair'
})

cart = Cart.new
cart.parts << part1

cart.user = user1
cart.save