# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Resetting database..."

Match.destroy_all
Player.destroy_all

puts "Seeding Badminton League data..."

# Clear existing data safely
Match.delete_all
Player.delete_all

puts "Creating players..."

player_names = [
  "Roger Federer",
  "Rafael Nadal",
  "Novak Djokovic",
  "Andy Murray",
  "Lin Dan",
  "Lee Chong Wei",
  "Peter Gade",
  "Taufik Hidayat",
  "Viktor Axelsen",
  "Kento Momota"
]

players = player_names.map do |name|
  Player.create!(name: name)
end

puts "Created #{players.count} players"

puts "Creating matches..."

# Create realistic match distribution
match_results = [
  [0, 1], [0, 2], [0, 3],
  [1, 2], [1, 3],
  [2, 3],
  [4, 5], [4, 6], [4, 7],
  [5, 6], [5, 7],
  [6, 7],
  [8, 9], [8, 4], [9, 5],
  [2, 8], [0, 9], [1, 6],
  [3, 7], [5, 2],
  [8, 0], [9, 1], [4, 2],
  [7, 3], [6, 8]
]

match_results.each do |winner_index, loser_index|
  MatchRecorder.call(
    winner_id: players[winner_index].id,
    loser_id: players[loser_index].id
  )
end

puts "Created #{Match.count} matches"

puts "Seeding complete!"
