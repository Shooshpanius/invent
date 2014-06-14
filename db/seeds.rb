# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(
    login: 'admin',
    username: 'admin',
    pwd: '12345',
    adm: 1,
    active: 1
)

territory = Territory.create(
    name: '---',
    address: '---'
)

room = territory.rooms.create(
    name: '---'
)

workplace = room.workplaces.create(
    name: '---'
)