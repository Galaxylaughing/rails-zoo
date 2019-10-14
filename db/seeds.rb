# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

animals = [
  {
    name: "Georgia",
    species: "lion",
    age: 4,
    image: "https://i2-prod.mirror.co.uk/incoming/article15994627.ece/ALTERNATES/s810/0_Lioness.jpg",
  },
  {
    name: "Zoomba",
    species: "jaguar",
    age: 2,
    image: "https://bigcatrescue.org/wp-content/uploads/2015/07/jaguar-1310184-1.jpg",
  },
  {
    name: "Kira",
    species: "opossum",
    age: 6,
    image: "https://www.motherjones.com/wp-content/uploads/2019/07/Opossum-cute.jpg",
  },
  {
    name: "Brian",
    species: "armadillo",
    age: 2,
    image: "https://timedotcom.files.wordpress.com/2015/07/armadillo.jpg",
  },
  {
    name: "Ducky",
    species: "alligator",
    age: 17,
    image: "https://news.wttw.com/sites/default/files/styles/full/public/article/image-non-gallery/Alligator%201_0711.jpg?itok=QbxFAfy4",
  },
  {
    name: "Minnie",
    species: "field mouse",
    age: 1,
    image: "https://co0069yjui-flywheel.netdna-ssl.com/wp-content/uploads/2016/07/Field-Mouse.jpg",
  }
]

animal_failures = []
animals.each do |task|
  new_animal = Animal.new
  new_animal.name = animal[:name]
  new_animal.species = animal[:species]
  new_animal.age = animal[:age]
  new_animal.image = animal[:image]
  
  successful = new_animal.save
  if !successful
    animal_failures << new_animal
    puts "Failed to save animal: #{new_animal.inspect}"
  else
    puts "Created animal: #{new_animal.inspect}"
  end
end

puts "Added #{Animal.count} animal records"
puts "#{animal_failures.length} animals failed to save"
