json.array!(@results) do |result|
  json.extract! result, :id, :student_id, :points, :mark
  json.url result_url(result, format: :json)
end
