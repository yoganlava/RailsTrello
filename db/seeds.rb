# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "date"
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
            custom_url: "example"
        },
        {
            name: "Example board two",
            creator: 1,
            color: "green",
            image: "https://images.unsplash.com/photo-1522383225653-ed111181a951?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1055&q=80",
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

CardTable.create(
    [
        {
            board_id: 1,
            column_index: 0,
            name: "Table One"
        },
        {
            board_id: 1,
            column_index: 1,
            name: "Groceries"
        }
    ]
)

Card.create(
    [
        {
            parent_id: 1,
            name: "Card One",
            completed: false,
            description: "This is a card",
            priority: 0,
            due_date: Date.tomorrow.to_s
        },
        {
            parent_id: 1,
            name: "Card Two",
            completed: true,
            description: "This is a completed card",
            priority: 1,
            due_date: Date.tomorrow.to_s
        },
        {
            parent_id: 2,
            name: "Cat food",
            completed: false,
            description: "For the dog!",
            priority: 0,
            due_date: Date.tomorrow.to_s
        },
        {
            parent_id: 2,
            name: "Bananas",
            completed: true,
            description: "Potassium is vital!",
            priority: 1,
            due_date: Date.tomorrow.to_s
        },
        {
            parent_id: 2,
            name: "Apples",
            completed: false,
            description: "An apple a day, keeps ...",
            priority: 3,
            due_date: Date.tomorrow.to_s
        },
        {
            parent_id: 2,
            name: "Coke",
            completed: false,
            description: "Best beverage!",
            priority: 4,
            due_date: Date.tomorrow.to_s
        }
    ]
)