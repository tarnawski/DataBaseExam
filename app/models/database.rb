class Database < ActiveRecord::Base

validates_presence_of :name 
validates_uniqueness_of(:name) 
validates_presence_of :comment 
validates_presence_of :host 
validates_presence_of :username 
validates_presence_of :password 
validates_presence_of :database 
end
