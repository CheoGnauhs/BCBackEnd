# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(handle: 'ecnelises', password: 'This1s#t',
            password_confirmation: 'This1s#t', location: 'Shanghai',
            district: 'Yangpu', address: 'No.1239 Siping Rd.',
            email: 'fwage73@gmail.com', telephone: '13807896609', credit: 20)