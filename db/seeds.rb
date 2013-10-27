# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(email: "finlay.mark@gmail.com", password: "12345678", password_confirmation: "12345678")

Prize.create!(title: "Money Back", description: "Get your money back if you lose!")
Prize.create!(title: "5% Bonus", description: "5% Bonus if you win!")
Prize.create!(title: "Double SP", description: "Double the SP price if you win!")
Prize.create!(title: "Extra Points", description: "Add 2 points to your price if you win!")
Prize.create!(title: "Price Boost", description: "Get the next price up if you win!")
Prize.create!(title: "Round Up", description: "Round the payout to the next €10")
Prize.create!(title: "Double Dog", description: "Double payout if Tp 2 wins the next")
Prize.create!(title: "Doggie Bet", description: "€5 free doggie bet if you win!")
Prize.create!(title: "Dist. % Bouns", description: "1% for each length you win by")
Prize.create!(title: "10% Bonus", description: "10% Bonus if you win!")
Prize.create!(title: "15% Bonus", description: "15% Bonus if you win!")
Prize.create!(title: "Virtuals Bet", description: "€5 free virtual bet if you win!")