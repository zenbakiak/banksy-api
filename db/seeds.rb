# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

FactoryBot.create(
  :user,
  username: 'zenbakiak',
  email: 'zenbakiak@me.com'
)
puts 'User: zenbakiak created'

FactoryBot.create(
  :user,
  username: 'jcmalpizar',
  email: 'jcmalpizar@gmail.com'
)

puts 'User: jcmalpizar created'
