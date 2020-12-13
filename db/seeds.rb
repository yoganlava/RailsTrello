# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
    [
        {
            email: "udeshya@hotmail.co.uk",
            password: "password"
        }
    ]
)

Board.create(
    [
        {
            name: "Example board One",
            creator: 1,
            color: "green",
            image: "",
            private: false,
            custom_url: "example"
        },
        {
            name: "Example board two",
            creator: 1,
            color: "green",
            image: "https://images.unsplash.com/photo-1522383225653-ed111181a951?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1055&q=80",
            private: false,
            custom_url: "exampletwo"
        }
    ]
)

BoardAccess.create!([
    {
        user_id: 2,
        board_id: 1
    }
])
