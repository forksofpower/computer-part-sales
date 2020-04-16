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
    user: User.find(1),
    price: 750.00,
    condition: 'new'
})

listing2 = Listing.create({
    part: part2,
    user: User.find(2),
    price: 75.00,
    condition: 'fair'
})


cart = User.find(1).current_cart
# binding.pry
cart.listings << listing1
cart.save