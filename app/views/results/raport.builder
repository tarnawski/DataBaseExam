xml.instruct! 
xml.comment! "Nazwa testu: " + @test.name
  @results.each do |result|
    xml.result do
      xml.student User.find(result.student_id).firstname+ ' ' + User.find(result.student_id).lastname
      xml.points result.points      
      xml.mark result.mark
      Answer.where(student_id: result.student_id, test_id: @test.id).each do |answer|
	    xml.answer do
              xml.question Question.find(answer.question_id).content 
	      xml.answer answer.answer      
	    end
	  end
    end
  end
