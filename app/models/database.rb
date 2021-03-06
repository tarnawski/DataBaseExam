class Database < ActiveRecord::Base
  validates_presence_of :name 
  validates_uniqueness_of(:name) 
  validates_presence_of :comment 
  validates_presence_of :host 
  validates_presence_of :username 
  validates_presence_of :password 
  validates_presence_of :database 
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end

