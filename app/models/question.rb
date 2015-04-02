class Question < ActiveRecord::Base
belongs_to :test

validates_presence_of :content 
validates_presence_of :answer_a 
validates_presence_of :answer_b 
validates_presence_of :answer_c 
validates_presence_of :answer_d 
validate :some_answer_should_be_true



def some_answer_should_be_true
    if a_is_correct == false && b_is_correct == false && c_is_correct == false && d_is_correct == false
    errors[:base] << "Some answer should be true"
    end
end

end
