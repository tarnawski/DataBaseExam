FactoryGirl.define do
  factory :zadany, :class => 'Zadanie' do
    query "MyString"
content "MyText"
  end

end
