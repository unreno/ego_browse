# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



RailsRole.create(name: 'create')
RailsRole.create(name: 'read')
RailsRole.create(name: 'update')
RailsRole.create(name: 'destroy')
RailsRole.create(name: 'admin')

u = RailsUser.find_by(login: 'admin')
u.rails_roles << RailsRole.find_by(name: 'admin')

