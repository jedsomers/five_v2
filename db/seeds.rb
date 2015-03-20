# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name: "Jed Somers",
            email: "jed@fiveme.io",
            password: "Fivemebro!",
            password_confirmation: "Fivemebro!",
            hometown: "Glencoe IL",
            age: "25",
            admin: true,
            manager: true
            )
            
User.create!(name: "Jeff Garoon",
            email: "jeff@fiveme.io",
            password: "Fivemebro!",
            password_confirmation: "Fivemebro!",
            hometown: "Glencoe IL",
            age: "25",
            admin: true,
            manager: true
            )
            

            

                