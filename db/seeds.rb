require 'faker'

# Clear existing data
puts 'Beginning the seed process...'
Review.destroy_all
puts 'Destroying previous reviews'
Event.destroy_all
puts 'Destroying previous events'
FightersAvailability.destroy_all
puts 'Destroying previous fighters availabilities'
Fighter.destroy_all
puts 'Destroying previous fighters'
User.destroy_all
puts 'Destroying previous users'

puts "Creating users..."
user1 = User.create!(
  email: Faker::Internet.unique.email,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  password: "password123",
  description: "A mild-mannered librarian by day, thrill-seeker by night."
)

user2 = User.create!(
  email: Faker::Internet.unique.email,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  password: "password123",
  description: "Dreams of becoming the world’s best amateur chef, and a decent street brawler."
)

user3 = User.create!(
  email: Faker::Internet.unique.email,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  password: "password123",
  description: "Just a regular person with a not-so-regular interest in urban survival."
)

user4 = User.create!(
  email: Faker::Internet.unique.email,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  password: "password123",
  description: "Loves long walks on the beach... and watching underground fights."
)

user5 = User.create!(
  email: Faker::Internet.unique.email,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  password: "password123",
  description: "Trains in martial arts on weekends, but only when not playing video games."
)

user6 = User.create!(
  email: Faker::Internet.unique.email,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  password: "password123",
  description: "A food critic who has never given a five-star review."
)

user7 = User.create!(
  email: Faker::Internet.unique.email,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  password: "password123",
  description: "Spends weekends as a part-time magician, but not a fan of rabbits."
)

user8 = User.create!(
  email: Faker::Internet.unique.email,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  password: "password123",
  description: "Thinks they're a superhero but still trying to find their powers."
)

user9 = User.create!(
  email: Faker::Internet.unique.email,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  password: "password123",
  description: "A chess grandmaster who plays 10 games at once. Also loves ice cream."
)

user10 = User.create!(
  email: Faker::Internet.unique.email,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  password: "password123",
  description: "Believes they can talk to animals. The animals are still undecided."
)

user11 = User.create!(
  email: 'xinhe@uberhits.com',
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  password: "123456",
  description: "I love puppies"
)

user12 = User.create!(
  email: 'severine@uberhits.com',
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  password: "123456",
  description: "I love nail art"
)

user13 = User.create!(
  email: 'adil@uberhits.com',
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  password: "123456",
  description: "I love airplanes"
)

user14 = User.create!(
  email: 'laurene@uberhits.com',
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  password: "123456",
  description: "I love water"
)

# Create 5 Users who are also Fighters
puts "Cooking up some fighters..."



fighter1 = Fighter.create!(
  user: user1,
  first_name: user1.first_name,
  last_name: user1.last_name,
  nickname: "Iron Knuckles",
  birth_date: Faker::Date.between(from: '1980-01-01', to: '2000-12-31'),
  height: 185,
  weight: 95,
  fight_style: "Brawler",
  description: "A legend on the streets, feared for his raw power and iron-clad fists.",
  price: 500.00,
  have_insurance: true,
  address: "16 Villa Gaudelet, Paris",
  latitude: 48.864716,
  longitude: 2.349014,
  image_path: "1"
)

fighter2 = Fighter.create!(
  user: user2,
  first_name: user2.first_name,
  last_name: user2.last_name,
  nickname: "The Shadow",
  birth_date: Faker::Date.between(from: '1980-01-01', to: '2000-12-31'),
  height: 175,
  weight: 70,
  fight_style: "Ninja Arts",
  description: "Silent, deadly, and always one step ahead. If you see him, it's too late.",
  price: 750.00,
  have_insurance: false,
  address: "10 Rue de Rivoli, Paris",
  latitude: 48.855503,
  longitude: 2.352133,
  image_path: "2"
)

fighter3 = Fighter.create!(
  user: user3,
  first_name: user3.first_name,
  last_name: user3.last_name,
  nickname: "Street King Pin",
  birth_date: Faker::Date.between(from: '1980-01-01', to: '2000-12-31'),
  height: 180,
  weight: 80,
  fight_style: "Kickboxing",
  description: "He rules the streets with quick reflexes and a bottle of Cola.",
  price: 600.00,
  have_insurance: true,
  address: "25 Rue du Faubourg Saint-Antoine, Paris",
  latitude: 48.852968,
  longitude: 2.369903,
  image_path: "3"
)

fighter4 = Fighter.create!(
  user: user4,
  first_name: user4.first_name,
  last_name: user4.last_name,
  nickname: "Razorblade",
  birth_date: Faker::Date.between(from: '1980-01-01', to: '2000-12-31'),
  height: 170,
  weight: 65,
  fight_style: "Muay Thai",
  description: "Sharper than a knife, this fighter’s elbows and knees leave scars.",
  price: 550.00,
  have_insurance: false,
  address: "50 Avenue de Paris, Vincennes",
  latitude: 48.8452571,
  longitude: 2.432615,
  image_path: "4"
)

fighter5 = Fighter.create!(
  user: user5,
  first_name: user5.first_name,
  last_name: user5.last_name,
  nickname: "Hurricane",
  birth_date: Faker::Date.between(from: '1980-01-01', to: '2000-12-31'),
  height: 190,
  weight: 85,
  fight_style: "Capoeira",
  description: "A whirlwind of kicks and spins, unstoppable once he gets going.",
  price: 700.00,
  have_insurance: true,
  address: "32 Rue de la Convention, Paris",
  latitude: 48.8445518,
  longitude: 2.2800784,
  image_path: "16"
)

fighter6 = Fighter.create!(
  user: user6,
  first_name: "Khamzot",
  last_name: "Chat-Maev",
  nickname: "Borzinger",
  birth_date: Faker::Date.between(from: '1980-01-01', to: '2000-12-31'),
  height: 185,
  weight: 84,
  fight_style: "Wrestling & Sambo",
  description: "A relentless grappler from Chechnya, feared for his brutal ground game... And you know, I'm from Chechnya",
  price: 1000.00,
  have_insurance: true,
  address: "5 Place des Vosges, Paris",
  latitude: 48.8551115,
  longitude: 2.3644399,
  image_path: "6"
)

fighter7 = Fighter.create!(
  user: user7,
  first_name: "Jonny",
  last_name: "Jaune",
  nickname: "Banned",
  birth_date: Faker::Date.between(from: '1980-01-01', to: '2000-12-31'),
  height: 193,
  weight: 93,
  fight_style: "MMA",
  description: "An unpredictable and versatile fighter from the USA, known for his reach and technique.",
  price: 1500.00,
  have_insurance: true,
  address: "45 Avenue des Champs-Élysées, Paris",
  latitude: 48.867495,
  longitude: 2.317430,
  image_path: "7"
)

fighter8 = Fighter.create!(
  user: user13,
  first_name: "Thierry",
  last_name: "Rodriguez",
  nickname: "El Tigre Chino",
  birth_date: Faker::Date.between(from: '1980-01-01', to: '2000-12-31'),
  height: 180,
  weight: 66,
  fight_style: "Taekwondo & Boxing",
  description: "A flashy striker from Mexico in Paris, known for his great hairs, kicks and fast hands.",
  price: 800.00,
  have_insurance: false,
  address: "60 Rue de Belleville, Paris",
  latitude: 48.874048,
  longitude: 2.379859,
  image_path: "8"
)

fighter9 = Fighter.create!(
  user: user8,
  first_name: "Zhang",
  last_name: "Weili",
  nickname: "Magnum",
  birth_date: Faker::Date.between(from: '1980-01-01', to: '2000-12-31'),
  height: 165,
  weight: 52,
  fight_style: "Sanda & MMA",
  description: "A powerful and technical fighter from China, dominating her opponents with sheer strength.",
  price: 900.00,
  have_insurance: true,
  address: "12 Boulevard Haussmann, Paris",
  latitude: 48.875328,
  longitude: 2.329027,
  image_path: "9"
)

fighter10 = Fighter.create!(
  user: user8,
  first_name: "Ciryl",
  last_name: "Gané",
  nickname: "Mauvais Gamin",
  birth_date: Faker::Date.between(from: '1980-01-01', to: '2000-12-31'),
  height: 196,
  weight: 112,
  fight_style: "Muay Thai & MMA",
  description: "A smooth-moving heavyweight from France that will casser ta bouche si tu parles trop.",
  price: 1400.00,
  have_insurance: true,
  address: "16 Rue du Chemin Vert, Paris",
  latitude: 48.859964,
  longitude: 2.377573,
  image_path: "13"
)

# Create Events happening between 10/05/2024 and 10/08/2024
puts "Creating events..."

event1 = Event.create!(
  title: "The Alleyway Ambush",
  fight_type: "ambush",
  place: "Backstreet behind the old diner",
  start_time: DateTime.new(2024, 9, 11, 21, 0),
  end_time: DateTime.new(2024, 9, 11, 23, 0),
  target: "Territory Control",
  description: "The winner controls the turf. The loser? Well, they just lose.",
  user: user1,
  fighter: fighter3,
  status: "pending",
  image_path: "5"
)

event2 = Event.create!(
  title: "Battle for the Last Slice",
  fight_type: "programmed",
  place: "Downtown Pizzeria",
  start_time: DateTime.new(2024, 6, 15, 19, 0),
  end_time: DateTime.new(2024, 6, 15, 21, 0),
  target: "The coveted last slice of pizza",
  description: "Only one fighter walks away with the slice, the other with a bruised ego.",
  user: user2,
  fighter: fighter1,
  status: "accepted",
  image_path: "6"
)

event3 = Event.create!(
  title: "Subway Showdown",
  fight_type: "ambush",
  place: "Underground Metro Station",
  start_time: DateTime.new(2024, 7, 20, 22, 0),
  end_time: DateTime.new(2024, 7, 20, 23, 30),
  target: "Bragging rights on the train",
  description: "A no-holds-barred brawl to determine who gets the corner seat on the train.",
  user: user3,
  fighter: fighter4,
  status: "declined",
  image_path: "7"
)

event4 = Event.create!(
  title: "Rooftop Corner",
  fight_type: "programmed",
  place: "Orly Rooftop",
  start_time: DateTime.new(2024, 8, 14, 20, 0),
  end_time: DateTime.new(2024, 8, 14, 22, 0),
  target: "Control of the rin-té (or at least the rooftop)",
  description: "A high-stakes fight for the control of the corner.",
  user: user4,
  fighter: fighter2,
  status: "pending",
  image_path: "8"
)

event5 = Event.create!(
  title: "Brawl in the Warehouse",
  fight_type: "programmed",
  place: "Abandoned Warehouse",
  start_time: DateTime.new(2024, 8, 5, 21, 0),
  end_time: DateTime.new(2024, 8, 5, 23, 0),
  target: "Ownership of the hidden stash",
  description: "Fighters clash in the dark corners of the warehouse, winner takes all.",
  user: user5,
  fighter: fighter4,
  status: "accepted",
  image_path: "9"
)

event6 = Event.create!(
  title: "Parking Lot Melee",
  fight_type: "ambush",
  place: "Carrefour Parking Lot",
  start_time: DateTime.new(2024, 8, 16, 18, 0),
  end_time: DateTime.new(2024, 8, 16, 19, 0),
  target: "Best parking spot",
  description: "Two cars, one spot. Only the strongest survives.",
  user: user1,
  fighter: fighter2,
  status: "pending",
  image_path: "10"
)

event7 = Event.create!(
  title: "Cafe Clash",
  fight_type: "programmed",
  place: "Quiet Corner Cafe",
  start_time: DateTime.new(2024, 7, 10, 17, 0),
  end_time: DateTime.new(2024, 7, 10, 18, 0),
  target: "Control of the coffee machine",
  description: "It’s about more than just coffee, it's about respect.",
  user: user2,
  fighter: fighter4,
  status: "accepted",
  image_path: "11"
)

event8 = Event.create!(
  title: "Garage Grapple",
  fight_type: "ambush",
  place: "Underground Parking Garage",
  start_time: DateTime.new(2024, 7, 30, 20, 0),
  end_time: DateTime.new(2024, 7, 30, 21, 0),
  target: "Control of the best parking spots",
  description: "Who said parking was easy? Not when you're fighting for it.",
  user: user3,
  fighter: fighter5,
  status: "declined",
  image_path: "12"
)

event9 = Event.create!(
  title: "Beachside Bash",
  fight_type: "programmed",
  place: "Sunny Beach",
  start_time: DateTime.new(2024, 8, 8, 15, 0),
  end_time: DateTime.new(2024, 8, 8, 17, 0),
  target: "Claiming the best spot on the sand",
  description: "Sun, sand, and a fistfight to remember.",
  user: user4,
  fighter: fighter1,
  status: "accepted",
  image_path: "13"
)

event10 = Event.create!(
  title: "Mall Mayhem",
  fight_type: "ambush",
  place: "Downtown Mall",
  start_time: DateTime.new(2024, 8, 18, 14, 0),
  end_time: DateTime.new(2024, 8, 18, 16, 0),
  target: "The last pair of sneakers on sale",
  description: "When fashion meets fury, only one can walk out in style.",
  user: user5,
  fighter: fighter3,
  status: "pending",
  image_path: "14"
)

event11 = Event.create!(
  title: "Caucasus Confrontation",
  fight_type: "ambush",
  place: "Dark Alley Behind the Gym",
  start_time: DateTime.new(2024, 5, 15, 18, 0),
  end_time: DateTime.new(2024, 5, 15, 20, 0),
  target: "Bully from the local gym",
  description: "Borzinger faces off with the local gym's toughest bully. It's a battle for the alley's respect.",
  user: user9,  # A user who is not a fighter
  fighter: fighter6,
  status: "accepted",
  is_private: false,
  image_path: "15"
)

event12 = Event.create!(
  title: "Backyard Brawl",
  fight_type: "programmed",
  place: "Neighbor's Backyard BBQ",
  start_time: DateTime.new(2024, 8, 20, 21, 0),
  end_time: DateTime.new(2024, 8, 20, 23, 0),
  target: "The guy who always flips burgers wrong",
  description: "Jonny 'Banned' Jaune is here to settle the score with the neighbor who can’t grill properly.",
  user: user12, # A user who is not a fighter
  fighter: fighter7,
  status: "pending",
  is_private: true,
  image_path: "16"
)

event13 = Event.create!(
  title: "Taco Takeover",
  fight_type: "ambush",
  place: "Street Taco Stand",
  start_time: DateTime.new(2024, 7, 5, 17, 0),
  end_time: DateTime.new(2024, 7, 5, 19, 0),
  target: "The last taco of the night",
  description: "El Tigre Chino fights for the last taco. Who knew tacos could lead to such a showdown?",
  user: user8,  # A user who is not a fighter
  fighter: fighter8,
  status: "accepted",
  is_private: false,
  image_path: "5"
)

event14 = Event.create!(
  title: "The Noodle Nemesis",
  fight_type: "programmed",
  place: "The Famous Chinatown Noodle Shop",
  start_time: DateTime.new(2024, 8, 10, 18, 0),
  end_time: DateTime.new(2024, 8, 10, 20, 0),
  target: "Rival chef in the kitchen",
  description: "Magnum steps up to the challenge against a rival chef who claims to have the better noodles.",
  user: user9,  # A user who is not a fighter
  fighter: fighter9,
  status: "accepted",
  is_private: true,
  image_path: "8"
)

event15 = Event.create!(
  title: "Boulangerie Beatdown",
  fight_type: "ambush",
  place: "Parisian Bakery",
  start_time: DateTime.new(2024, 8, 25, 22, 0),
  end_time: DateTime.new(2024, 8, 25, 23, 30),
  target: "The baker who sold stale croissants",
  description: "Mauvais Gamin takes on the local baker after being served a stale croissant. Justice is served.",
  user: user10,  # A user who is not a fighter
  fighter: fighter10,
  status: "pending",
  is_private: false,
  image_path: "10"
)

event16 = Event.create!(
  title: "Mêlage de Mathieu",
  fight_type: "ambush",
  place: "18 rue de la croix, dans le 60",
  start_time: DateTime.new(2024, 8, 16, 18, 0),
  end_time: DateTime.new(2024, 8, 16, 20, 0),
  target: "Mathieu le Wulfens et son yorkshire là",
  description: "Il parle mal et a besoin d'une bonne mêlée des familles. Il faut bien le mélanger",
  user: user13,  # A user who is not a fighter
  fighter: fighter10,
  status: "accepted",
  is_private: false,
  image_path: "12"
)

event17 = Event.create!(
  title: "Vengeance",
  fight_type: "ambush",
  place: "Chez Mario",
  start_time: DateTime.new(2024, 8, 16, 18, 0),
  end_time: DateTime.new(2024, 8, 16, 20, 0),
  target: "Mario the Mario",
  description: "Apparemment c'est une légende, il faut l'éteindre.",
  user: user3,  # A user who is not a fighter
  fighter: fighter9,
  status: "accepted",
  is_private: false,
  image_path: "8"
)

# Create 15 Reviews
puts "Creating reviews..."

Review.create!(
  comment: "Iron Knuckles was brutal. I'm lucky to have walked away!",
  rating: 5,
  user_to_fighter: true,
  event: event2
)

Review.create!(
  comment: "I thought I was fast, but The Shadow was like a ghost.",
  rating: 4,
  user_to_fighter: true,
  event: event4
)

Review.create!(
  comment: "Street King is not to be messed with. Learned that the hard way.",
  rating: 3,
  user_to_fighter: true,
  event: event1
)

Review.create!(
  comment: "Razorblade? More like butter knife. I've seen sharper.",
  rating: 2,
  user_to_fighter: false,
  event: event3
)

Review.create!(
  comment: "Hurricane? More like a gentle breeze. Easy win.",
  rating: 1,
  user_to_fighter: true,
  event: event5
)

Review.create!(
  comment: "Mission accomplished. The rooftop is now under my control.",
  rating: 5,
  user_to_fighter: false,
  event: event4
)

Review.create!(
  comment: "The target was tough, but nothing I couldn't handle.",
  rating: 4,
  user_to_fighter: false,
  event: event6
)

Review.create!(
  comment: "The only thing sharper than my elbows was my wit.",
  rating: 5,
  user_to_fighter: false,
  event: event7
)

Review.create!(
  comment: "Street King? More like Street Peasant. Easy mission.",
  rating: 4,
  user_to_fighter: false,
  event: event8
)

Review.create!(
  comment: "The pizza was worth the fight. Would do it again.",
  rating: 5,
  user_to_fighter: false,
  event: event2
)

Review.create!(
  comment: "I'll never look at a subway seat the same way again.",
  rating: 3,
  user_to_fighter: true,
  event: event3
)

Review.create!(
  comment: "A fight for a beach spot? Totally worth the tan.",
  rating: 5,
  user_to_fighter: true,
  event: event9
)

Review.create!(
  comment: "Mall security never saw us coming. Perfect ambush.",
  rating: 4,
  user_to_fighter: false,
  event: event10
)

Review.create!(
  comment: "The target underestimated me. Big mistake.",
  rating: 5,
  user_to_fighter: false,
  event: event1
)

Review.create!(
  comment: "Fighting for parking spots should be an Olympic sport.",
  rating: 4,
  user_to_fighter: true,
  event: event6
)

Review.create!(
  comment: "Borzinger took down the gym bully like he was made of paper. Remind me to stay out of that alley.",
  rating: 5,
  user_to_fighter: true,
  event: event11
)

Review.create!(
  comment: "I thought I could grill, but after Jonny's beating, I think I'll stick to salads.",
  rating: 5,
  user_to_fighter: true,
  event: event12
)

Review.create!(
  comment: "El Tigre Chino fought like a man possessed... by the spirit of a taco. I didn’t stand a chance.",
  rating: 4,
  user_to_fighter: true,
  event: event13
)

Review.create!(
  comment: "Magnum’s noodle skills were deadly. I’ll never look at ramen the same way again.",
  rating: 5,
  user_to_fighter: true,
  event: event14
)

Review.create!(
  comment: "Mauvais Gamin made sure that baker will never sell stale croissants again. A true hero.",
  rating: 4,
  user_to_fighter: true,
  event: event15
)

Review.create!(
  comment: "The gym bully didn’t stand a chance. Borzinger is a monster.",
  rating: 5,
  user_to_fighter: false,
  event: event11
)

Review.create!(
  comment: "That backyard brawl was something else. Jonny has hands like bricks.",
  rating: 5,
  user_to_fighter: false,
  event: event12
)

Review.create!(
  comment: "The taco stand will never be the same. El Tigre Chino’s kicks are as spicy as the salsa.",
  rating: 4,
  user_to_fighter: false,
  event: event13
)

Review.create!(
  comment: "Magnum’s strength in the kitchen is only matched by her strength in the ring. I need new teeth.",
  rating: 5,
  user_to_fighter: false,
  event: event14
)

Review.create!(
  comment: "The baker didn’t know what hit him. Mauvais Gamin showed no mercy.",
  rating: 4,
  user_to_fighter: false,
  event: event15
)

puts "Seed data created successfully!"
