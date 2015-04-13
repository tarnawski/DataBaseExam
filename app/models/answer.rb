class Answer < ActiveRecord::Base
belongs_to :student

def self.mark(test_id, points)
    current_test = Test.find(test_id)
    if current_test.standard_score
    max=Question.where(test_id: test_id).count
    if max>current_test.number_of_questions
    max=current_test.number_of_questions 
    end
    proc=(points*100)/max
    if proc>=95
    return 5;
    elsif proc>=75
    return 4;
    elsif proc>=50
    return 3;
    elsif proc<50
    return 2;
    end
    else
    if points>=current_test.bdb
    return 5;
    elsif points>=current_test.bd
    return 4;
    elsif points>=current_test.dost
    return 3;
    elsif points<current_test.dost
    return 2;
    end
    end
end

def self.points(current_student_id)
    points = 0
    user_answer = Answer.where(student_id: current_student_id).all
    user_answer.each do |answer|
    good_answer = Question.find(answer.question_id)
    if(answer.answer_a == good_answer.a_is_correct && answer.answer_b == good_answer.b_is_correct && answer.answer_c ==     good_answer.c_is_correct && answer.answer_d == good_answer.d_is_correct)
    points = points + 1;
    end
end
end
end

