require 'rails_helper'

RSpec.describe Answer, type: :model do

  describe '#mark' do

      before do
        test = Test.create!(:id=>1, :name=>"Test", :available=>1, :database=>1, :standard_score => 0, :bdb => 5 , :bd => 3, :dost => 1)	
	test2 = Test.create!(:id=>2, :name=>"Test2", :available=>1, :database=>1, :standard_score => 1, :number_of_questions => 10)
	question1 = Question.create!(:id=>1, :test_id =>2, :content => "Wypisz wszstkie ceny", :query => "Select * from ceny")
	question2 = Question.create!(:id=>2, :test_id =>2, :content => "Wypisz wszstkie ceny", :query => "Select * from ceny")
	question3 = Question.create!(:id=>3, :test_id =>2, :content => "Wypisz wszstkie ceny", :query => "Select * from ceny")
	question4 = Question.create!(:id=>4, :test_id =>2, :content => "Wypisz wszstkie ceny", :query => "Select * from ceny")
	question5 = Question.create!(:id=>5, :test_id =>2, :content => "Wypisz wszstkie ceny", :query => "Select * from ceny") 
	question6 = Question.create!(:id=>6, :test_id =>2, :content => "Wypisz wszstkie ceny", :query => "Select * from ceny")
	question7 = Question.create!(:id=>7, :test_id =>2, :content => "Wypisz wszstkie ceny", :query => "Select * from ceny")
	question8 = Question.create!(:id=>8, :test_id =>2, :content => "Wypisz wszstkie ceny", :query => "Select * from ceny")
	question9 = Question.create!(:id=>9, :test_id =>2, :content => "Wypisz wszstkie ceny", :query => "Select * from ceny")
	question10 = Question.create!(:id=>10, :test_id =>2, :content => "Wypisz wszstkie ceny", :query => "Select * from ceny")         
      end

      it 'schould got 2' do
        expect(Answer.mark(1, 0)).to eq 2
      end
      it 'schould got 3' do
        expect(Answer.mark(1, 1)).to eq 3
      end
      it 'schould got 3.5' do
        expect(Answer.mark(1, 2)).to eq 3.5
      end
      it 'schould got 4' do
        expect(Answer.mark(1, 3)).to eq 4
      end
      it 'schould got 4.5' do
        expect(Answer.mark(1, 4)).to eq 4.5
      end
      it 'schould got 5' do
        expect(Answer.mark(1, 5)).to eq 5
      end
    
      it 'schould got 2' do
        expect(Answer.mark(2, 4)).to eq 2
      end
      it 'schould got 3' do
        expect(Answer.mark(2, 6)).to eq 3
      end
      it 'schould got 3.5' do
        expect(Answer.mark(2, 7)).to eq 3.5
      end
      it 'schould got 4' do
        expect(Answer.mark(2, 8)).to eq 4
      end
      it 'schould got 4.5' do
        expect(Answer.mark(2, 9)).to eq 4.5
      end
      it 'schould got 5' do
        expect(Answer.mark(2, 10)).to eq 5
      end
  end
end
