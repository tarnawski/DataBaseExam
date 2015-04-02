class Test < ActiveRecord::Base
has_many :questions

validates_presence_of :name
validates :name, uniqueness: true

end
