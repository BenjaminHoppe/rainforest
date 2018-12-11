# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.delete_all
Review.delete_all
prodcut_1 = Product.create!(name: "cup", description: "thing you drink out of", price: 1000000.01)

review_1 = Review.create!(body: "overpriced, would only buy if on sale", product_id: product_1.id)
