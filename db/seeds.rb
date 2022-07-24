# Create Category
Category.find_or_create_by(name: 'Spa and massage')
Category.find_or_create_by(name: 'Nails')
Category.find_or_create_by(name: 'Hair removal')
Category.find_or_create_by(name: 'Barbershop')

# top_left: [13.794782079116562, 100.39050901015118],
# top_right: [13.794782079116562, 100.50848970250476],
# bottom_left: [13.659159344839324, 100.39050901015118],
# bottom_right: [13.659159344839324, 100.50848970250476]
#
# # top_left: [13.933945806345012, 100.57790412862002],
# # top_right: [13.933945806345012, 100.84592767523894],
# # bottom_left: [13.714671040509412, 100.57790412862002],
# # bottom_right: [13.714671040509412, 100.83790308008486]

block = {
  0 => {
    min_lat: 13.659159344839324,
    max_lat: 13.794782079116562,
    min_lng: 100.39050901015118,
    max_lng: 100.50848970250476
 },

  1 => {
    min_lat: 13.714671040509412,
    max_lat: 13.933945806345012,
    min_lng: 100.57790412862002,
    max_lng: 100.84592767523894
  }
}
rng = Random.new(1234)
1000.times do |time|
  block_rng = [0, 1].sample
  category_rng = [1, 2, 3, 4].sample

  lat = block[block_rng][:min_lat] + rng.rand * (block[block_rng][:max_lat] - block[block_rng][:min_lat])
  lng = block[block_rng][:min_lng] + rng.rand * (block[block_rng][:max_lng] - block[block_rng][:min_lng])

  puts "SHOP#{time}: #{lat} #{lng}"
  Shop.create!(name: "SHOP#{time}", category_id: category_rng, latitude: lat, longitude: lng)
end
