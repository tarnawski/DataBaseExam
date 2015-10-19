require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let(:valid_attributes) { { query: 'MyString'} }
  let(:valid_session) { {} }
  let(:user) { build(:user) }

  before do
    database = Database.create!(:id=>1, :name=>"Baza danych", :comment=>"d",:adapter=>"postgresql", :host=>"localhost", :username=>"postgres", :password=>"tarnawski", :database=>"kolokwium")
    test = Test.create!(:id=>1, :name=>"Test", :available=>0, :database=>1)	
    question = Question.create!(:id=>1, :test_id =>1, :content => "Wypisz wszstkie ceny", :query => "Select * from ceny")
    question2 = Question.create!(:id=>2, :test_id =>1, :content => "Wypisz wszstkie ceny", :query => "Select * from ceny")
  end
   

  before do
    sign_in user
    controller.stub(:user_signed_in?).and_return(true)
    controller.stub(:current_user).and_return(user)
    controller.stub(:authenticate_user!).and_return(user)
  end

  context 'user is not an admin' do
    before do
      controller.current_user.stub(admin?: false)
    end

    describe 'GET new' do
      it 'redirects user to the login page' do
        session[:tab]=[1]
        get :new, {}, valid_session
        expect(response).to redirect_to(tests_path)
      end
    end
   
    describe 'PUT update' do
      it 'redirect user to the login page' do
        session[:tab]=[1]
        answer = Answer.create!(:id=>1, :student_id=>1, :question_id=>1, :answer=>"select * from ceny")
        put :update, {:id => answer.to_param, :answer => { 'name' => 'MyString'}}, valid_session
        expect(response).to redirect_to(tests_path)
      end
    end
 
    describe 'GET show' do
      it 'exposes the requested test' do
        session[:tab]=[1]
	answer = Answer.create!(:id=>1, :student_id=>1, :question_id=>1, :answer=>"select * from ceny")
        get :show, { id: answer.to_param }, valid_session
        expect(controller.answer).to eq(answer)
      end
    end
  end

  describe 'GET show' do
    it 'exposes the requested test' do
      Test.create!(:id=>2, :name=>"Test2", :available=>1, :database=>1)	
      Question.create!(:id=>5, :test_id =>2, :content => "Wypisz wszstkie ceny", :query => "Select * from ceny")
      answer = Answer.create!(:id=>1, :student_id=>user.id, :question_id=>5, :answer=>"select")
      session[:tab]=[5]
      get :show, { id: answer.to_param }, valid_session
      expect(response).to render_template('answers/show')
    end
  end

  describe 'GET show with SQLInjection rollback' do
    it 'exposes the requested test' do
      Test.create!(:id=>2, :name=>"Test2", :available=>1, :database=>1)	
      Question.create!(:id=>5, :test_id =>2, :content => "Wypisz wszstkie ceny", :query => "Select * from ceny")
      answer = Answer.create!(:id=>1, :student_id=>user.id, :question_id=>5, :answer=>"rollback")
      session[:tab]=[5]
      get :show, { id: answer.to_param }, valid_session
      expect(response).to redirect_to(tests_path)
    end
  end

  describe 'GET show with SQLInjection ROLLBACK' do
    it 'exposes the requested test' do
      Test.create!(:id=>2, :name=>"Test2", :available=>1, :database=>1)	
      Question.create!(:id=>5, :test_id =>2, :content => "Wypisz wszstkie ceny", :query => "Select * from ceny")
      answer = Answer.create!(:id=>1, :student_id=>user.id, :question_id=>5, :answer=>"ROLLBACK")
      session[:tab]=[5]
      get :show, { id: answer.to_param }, valid_session
      expect(response).to redirect_to(tests_path)
    end
  end

  describe 'GET show with SQLInjection commit' do
    it 'exposes the requested test' do
      Test.create!(:id=>2, :name=>"Test2", :available=>1, :database=>1)	
      Question.create!(:id=>5, :test_id =>2, :content => "Wypisz wszstkie ceny", :query => "Select * from ceny")
      answer = Answer.create!(:id=>1, :student_id=>user.id, :question_id=>5, :answer=>"commit")
      session[:tab]=[5]
      get :show, { id: answer.to_param }, valid_session
      expect(response).to redirect_to(tests_path)
    end
  end

  describe 'GET show with SQLInjection savepoint' do
    it 'exposes the requested test' do
      Test.create!(:id=>2, :name=>"Test2", :available=>1, :database=>1)	
      Question.create!(:id=>5, :test_id =>2, :content => "Wypisz wszstkie ceny", :query => "Select * from ceny")
      answer = Answer.create!(:id=>1, :student_id=>user.id, :question_id=>5, :answer=>"savepoint")
      session[:tab]=[5]
      get :show, { id: answer.to_param }, valid_session
      expect(response).to redirect_to(tests_path)
    end
  end
end
