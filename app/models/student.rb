class Student < ActiveRecord::Base
has_one :result
has_many :answer

end
