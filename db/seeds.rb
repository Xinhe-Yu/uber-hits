# Clear existing data
Review.destroy_all
Event.destroy_all
FightersAvailability.destroy_all
Fighter.destroy_all
User.destroy_all

# Create Users
user1 = User.create!(
  email: "john.doe@example.com",
  first_name: "John",
  last_name: "Doe",
  password: "password123",
  description: "A passionate boxing enthusiast."
)

user2 = User.create!(
  email: "jane.smith@example.com",
  first_name: "Jane",
  last_name: "Smith",
  password: "password123",
  description: "A former professional fighter."
)

# Create Fighters
fighter1 = Fighter.create!(
  user: user1,
  first_name: "Mike",
  last_name: "Tyson",
  nickname: "Iron Mike",
  birth_date: Date.new(1966, 6, 30),
  height: 178,
  weight: 100,
  fight_style: "Boxing",
  description: "A legendary heavyweight boxer."
)

fighter2 = Fighter.create!(
  user: user2,
  first_name: "Muhammad",
  last_name: "Ali",
  nickname: "The Greatest",
  birth_date: Date.new(1942, 1, 17),
  height: 191,
  weight: 107,
  fight_style: "Boxing",
  description: "One of the most famous boxers in history."
)

# Create Fighters' Availabilities
FightersAvailability.create!(
  fighter: fighter1,
  start_time: "08:00",
  end_time: "10:00"
)

FightersAvailability.create!(
  fighter: fighter2,
  start_time: "14:00",
  end_time: "16:00"
)

# Create Events
event1 = Event.create!(
  title: "Heavyweight Championship",
  fight_type: "programmed",
  place: "Madison Square Garden",
  start_time: "2024-08-20 19:00",
  end_time: "2024-08-20 22:00",
  target: "Heavyweight Title",
  description: "A match for the heavyweight championship title.",
  user: user1,
  fighter: fighter1,
  status: "pending"
)

event2 = Event.create!(
  title: "Exhibition Fight",
  fight_type: "ambush",
  place: "Caesars Palace",
  start_time: "2024-09-15 18:00",
  end_time: "2024-09-15 21:00",
  target: "Charity Event",
  description: "An exhibition fight for charity.",
  user: user2,
  fighter: fighter2,
  status: "accepted"
)

# Create Reviews
Review.create!(
  event: event1,
  comment: "An intense fight! The energy in the arena was unmatched.",
  rating: 5,
  user_to_fighter: true
)

Review.create!(
  event: event2,
  comment: "A great exhibition match for a good cause.",
  rating: 4,
  user_to_fighter: true
)

puts "Seed data created successfully!"
