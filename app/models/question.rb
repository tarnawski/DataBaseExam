class Question < ActiveRecord::Base
belongs_to :test

validates_presence_of :content 
validates_presence_of :query 


end
