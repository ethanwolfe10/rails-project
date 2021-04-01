# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
e = User.create(username: "ethan", email: "e@e", password: "password")
t = User.create(username: "t", email: "et@et", password: "password")
h = User.create(username: "s", email: "es@es", password: "password")
g = Group.create(name: 'group1', bio: 'bio')
g2 = Group.create(name: 'group2', bio: 'bio')
g3 = Group.create(name: 'group3', bio: 'bio')
s = Subscription.create(user_id: e.id, group_id: g.id, confirmed: true)
s2 = Subscription.create(user_id: t.id, group_id: g.id, confirmed: true)
s3 = Subscription.create(user_id: h.id, group_id: g.id, confirmed: true)
s4 = Subscription.create(user_id: e.id, group_id: g2.id, confirmed: false)
s5 = Subscription.create(user_id: e.id, group_id: g3.id, confirmed: false)
Follow.create(user_id: e.id, following_id: t.id)
Follow.create(user_id: e.id, following_id: h.id)
Follow.create(user_id: h.id, following_id: e.id)
Follow.create(user_id: t.id, following_id: e.id)
u1 = User.create(username: "u1", email: "u1@u1", password: "password")
u2 = User.create(username: "u2", email: "u2@u2", password: "password")
u3 = User.create(username: "u3", email: "u3@u3", password: "password")
u4 = User.create(username: "u4", email: "u4@u4", password: "password")

