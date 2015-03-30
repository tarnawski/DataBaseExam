json.array!(@questions) do |question|
  json.extract! question, :id, :test_id, :content, :answer_a, :answer_b, :answer_c, :answer_d, :correct
  json.url question_url(question, format: :json)
end
