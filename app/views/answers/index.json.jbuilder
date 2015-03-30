json.array!(@answers) do |answer|
  json.extract! answer, :id, :student_id, :question_id, :answer_a, :answer_b, :answer_c, :answer_d
  json.url answer_url(answer, format: :json)
end
