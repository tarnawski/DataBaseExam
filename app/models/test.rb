class Test < ActiveRecord::Base
has_many :questions

validates_presence_of :name
validates :name, uniqueness: true
validate :score_should_be_correct
validate :value_of_score_should_be_correct



def score_should_be_correct
    if bdb == 0 && bd == 0 && dost == 0 && standard_score == false
    errors[:base] << "If you do not write in the scoring please check Standard score"
    end
end

def value_of_score_should_be_correct
	if dost>=bd || bd>=bdb
    errors[:base] << "Value of scores is incorrect"
	end
    
end

end
