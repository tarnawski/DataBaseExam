json.array!(@tests) do |test|
  json.extract! test, :id, :name, :available, :user_id, :number_of_questions, :random, :time, :single_test, :standard_score, :bdb, :db, :dost
  json.url test_url(test, format: :json)
end
