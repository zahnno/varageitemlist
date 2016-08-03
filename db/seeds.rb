# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Sellers
Seller.create(name: "Greg", longitude: 40.7127837, latitude: -74.00594)
Seller.create(name: "Paul", longitude: 20.309320, latitude: 12.53353)
Seller.create(name: "John", longitude: 67.40033, latitude: -33.64798630024)

#Categories
Category.create(name: "Car")
Category.create(name: "Clothing")
Category.create(name: "Others")

#Items
Item.create(title: "Honda Civic", category_id: 1, status: "Available", price_cents: 433343434, seller_id: 1)
Item.create(title: "Toyota Camery", category_id: 1, status: "Banned", price_cents: 633043434, seller_id: 1)
Item.create(title: "Mazda 3", category_id: 1, status: "Sold", price_cents: 353434334, seller_id: 1)
Item.create(title: "Nissan Ultima", category_id: 1, status: "Sold", price_cents: 53230343, seller_id: 1)

Item.create(title: "Honda Accord", category_id: 1, status: "Available", price_cents: 200234343, seller_id: 2)
Item.create(title: "Diamond Earring", category_id: 3, status: "Sold", price_cents: 304343, seller_id: 2)
Item.create(title: "Green T-Shirt", category_id: 2, status: "Available", price_cents: 4343, seller_id: 2)

Item.create(title: "Jean Shorts", category_id: 2, status: "Pending", price_cents: 9843, seller_id: 3)
Item.create(title: "Iphone 6s", category_id: 3, status: "Expired", price_cents: 304343, seller_id: 3)
Item.create(title: "Charging Kit", category_id: 3, status: "Pending", price_cents: 2343, seller_id: 3)



