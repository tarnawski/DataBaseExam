# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

test_list = [
  [ "Nazwa testu", true, 1, 2, true, 0, true, true, 0, 0, 0 ],

]

test_list.each do |name, available, user_id, number_of_questions, random, time, single_test, standard_score, bdb, bd, dost|
  Test.create( name: name, available: available, user_id: user_id, number_of_questions: number_of_questions, random: random, time: time, single_test: single_test, standard_score: standard_score, bdb: bdb, bd: bd, dost: dost )
end

######################################################################################################
question_list = [
  [ 1, "Pytanie pierwsze", "Odp A do pyt 1", "Odp B do pyt 1", "Odp C do pyt 1", "Odp D do pyt 1", 1 ],
  [ 1, "Pytanie drugie", "Odp A do pyt 2", "Odp B do pyt 2", "Odp C do pyt 2", "Odp D do pyt 2", 1 ],
  [ 1, "Pytanie trzecie", "Odp A do pyt 3", "Odp B do pyt 3", "Odp C do pyt 3", "Odp D do pyt 3", 2 ]
]

question_list.each do |test_id, content, answer_a, answer_b, answer_c, answer_d, correct|
  Question.create( test_id: test_id, content: content, answer_a: answer_a, answer_b: answer_b, answer_c: answer_c, answer_d: answer_d, correct: correct )
end
