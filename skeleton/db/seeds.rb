4.times do
  User.create(
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: "password",
    )
end

commentable_type_array = ["Answer", "Question"]
75.times do 
  Comment.create(
    content: Faker::Lorem.paragraph(rand(1..4)),
    commentable_id: rand(1..20),
    commentable_type: commentable_type_array.sample,
    user_id: rand(1..4)
    )
end

20.times do 
  Answer.create(
    content: Faker::Lorem.paragraph(rand(1..4)),
    user_id: rand(1..4),
    question_id: rand(1..20)
    )
end

20.times do 
  Question.create(
    content: Faker::Lorem.paragraph(rand(1..4)),
    headline: Faker::Hacker.say_something_smart,
    user_id: rand(1..4)
    )
end