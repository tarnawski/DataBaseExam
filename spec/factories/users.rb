# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    firstname 'John'
    lastname 'Doe'
    email 'nickname@o2.pl'
    password 'password123'
  end
end
