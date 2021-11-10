# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |i|
	user = User.create(name: "User ##{i}", bio: "A bio.", posts_counter: 3)
	3.times do |j|
		post = Post.create(title: "Awesome Post", text: "Lorem Ipsum Dolor Amet", user_id: user)
		5.times do |j|
			Comment.create(text: "Comment ##{j}", post_id: post, user_id: user)
		end
	end
end
