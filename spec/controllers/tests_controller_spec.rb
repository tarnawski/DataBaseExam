require 'rails_helper'

RSpec.describe TestsController, type: :controller do

  let(:valid_attributes) { { name: 'MyString'} }
  let(:valid_session) { {} }
  let(:user) { build(:user) }

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
        get :new, {}, valid_session
        expect(response).to redirect_to(tests_path)
      end
    end

    describe 'GET edit' do
      it 'redirects user to the login page' do
        test = Test.create! valid_attributes
        get :edit, { id: test.to_param }, valid_session
        expect(response).to redirect_to(tests_path)
      end
    end
    
    describe 'POST create' do
      it 'redirects user to the login page' do
        post :create, {test: valid_attributes}, valid_session
        expect(response).to redirect_to(tests_path)
      end
    end
   
    describe 'PUT update' do
      it 'redirect user to the login page' do
        test = Test.create! valid_attributes
        put :update, {:id => test.to_param, :test => { 'name' => 'MyString'}}, valid_session
        expect(response).to redirect_to(tests_path)
      end
    end
  end
  
  context 'user is not an admin' do
    before do
      controller.current_user.stub(admin?: false)
    end

    describe 'GET new' do
      it 'redirects user to the login page' do
        get :new, {}, valid_session
        expect(response).to redirect_to(tests_path)
      end
    end

    describe 'GET edit' do
      it 'redirects user to the login page' do
        test = Test.create! valid_attributes
        get :edit, { id: test.to_param }, valid_session
        expect(response).to redirect_to(tests_path)
      end
    end

    describe 'POST create' do
      it 'redirects user to the login page' do
        post :create, {test: valid_attributes}, valid_session
        expect(response).to redirect_to(tests_path)
      end
    end

    describe 'PUT update' do
      it 'redirect user to the login page' do
        test = Test.create! valid_attributes
        put :update, {:id => test.to_param, :test => { 'name' => 'MyString'}}, valid_session
        expect(response).to redirect_to(tests_path)
      end
    end
  end

  context 'user is an admin' do
    before do
      controller.current_user.stub(admin?: true)
    end

  describe 'GET prepare_test' do
    it 'redirect to execute test' do
      test = Test.create!(:id=>1, :name=>"Test", :available=>1, :database=>1)	
      question = Question.create!(:id=>1, :test_id =>1, :content => "Wypisz wszstkie ceny", :query => "Select * from ceny")
      question2 = Question.create!(:id=>2, :test_id =>1, :content => "Wypisz wszstkie ceny", :query => "Select * from ceny")
      get :prepare_test, {:id=>1,:selected_test=>1}
      expect(response).to redirect_to(new_answer_path)
    end
  end

  describe 'GET prepare_test' do
    it 'redirect to execute test' do
      test = Test.create!(:id=>1, :name=>"Test", :available=>1, :database=>1,:number_of_questions=>3)	
      question = Question.create!(:id=>1, :test_id =>1, :content => "Wypisz wszstkie ceny", :query => "Select * from ceny")
      question2 = Question.create!(:id=>2, :test_id =>1, :content => "Wypisz wszstkie ceny", :query => "Select * from ceny")
      question3 = Question.create!(:id=>3, :test_id =>1, :content => "Wypisz wszstkie ceny", :query => "Select * from ceny")
      question4 = Question.create!(:id=>4, :test_id =>1, :content => "Wypisz wszstkie ceny", :query => "Select * from ceny")
      get :prepare_test, {:id=>1,:selected_test=>1}
      session[:tab].should eql [1,2,3]
    end
  end

  describe 'GET prepare_test' do
    it 'redirect to execute test' do
      test = Test.create!(:id=>1, :name=>"Test", :available=>1, :database=>1,:random=>true)	
      question = Question.create!(:id=>1, :test_id =>1, :content => "Wypisz wszstkie ceny", :query => "Select * from ceny")
      question2 = Question.create!(:id=>2, :test_id =>1, :content => "Wypisz wszstkie ceny", :query => "Select * from ceny")
      question3 = Question.create!(:id=>3, :test_id =>1, :content => "Wypisz wszstkie ceny", :query => "Select * from ceny")
      question4 = Question.create!(:id=>4, :test_id =>1, :content => "Wypisz wszstkie ceny", :query => "Select * from ceny")
      get :prepare_test, {:id=>1,:selected_test=>1}
      session[:tab].should_not eql [1,2,3,4]
    end
  end

  describe 'GET prepare_test' do
    it 'redirect to execute test' do
      test = Test.create!(:id=>1, :name=>"Test", :available=>1, :database=>1,:random=>true)	
      question = Question.create!(:id=>1, :test_id =>1, :content => "Wypisz wszstkie ceny", :query => "Select * from ceny")
      get :prepare_test, {:id=>1,:selected_test=>1}
      session[:start].should_not eql 0
    end
  end

  describe 'GET prepare_test' do
    it 'no questionin test, redirect to test' do
      test = Test.create!(:id=>1, :name=>"Test", :available=>1, :database=>1)	
      get :prepare_test, {:id=>1,:selected_test=>1}
      expect(response).to redirect_to(tests_path)
    end
  end

  describe 'GET index' do
    it 'exposes all tests' do
      test = Test.create! valid_attributes
      get :index, {}, valid_session
      expect(controller.tests).to eq([test])
    end
  end

    describe 'GET show' do
      it 'exposes the requested test' do
        test = Test.create! valid_attributes
        get :show, { id: test.to_param }, valid_session
        expect(controller.test).to eq(test)
      end
    end

    describe 'GET new' do
      it 'exposes a new test' do
        get :new, {}, valid_session
        expect(controller.test).to be_a_new(Test)
      end
    end

    describe 'GET edit' do
      it 'exposes the requested test' do
        test = Test.create! valid_attributes
        get :edit, { id: test.to_param }, valid_session
        expect(controller.test).to eq(test)
      end
    end

    describe 'POST create' do
      describe 'with valid params' do
        it 'creates a new Tests' do
          expect {
            post :create, {test: valid_attributes}, valid_session
          }.to change(Test, :count).by(1)
        end
      end

      describe 'with invalid params' do
        it "re-renders the 'new' template" do
          Test.any_instance.stub(:save).and_return(false)
          post :create, {test: { 'name' => 'invalid value'}}, valid_session
          expect(response).to render_template('new')
        end
      end
    end

    describe 'PUT update' do
      let(:test) { Test.create! valid_attributes }
      describe 'with valid params' do
        it 'updates the requested test' do
          Test.any_instance.should_receive(:update).with({ 'name' => 'MyString'})
          put :update, {:id => test.to_param, :test => { 'name' => 'MyString'}}, valid_session
        end
        it 'redirects to the test' do
          put :update, {:id => test.to_param, :test => valid_attributes}, valid_session
          response.should redirect_to(test)
        end
      end

      describe 'with invalid params' do
        it "re-renders the 'edit' template" do
          Test.any_instance.stub(:save).and_return(false)
          put :update, {:id => test.to_param, :test => { 'name' => 'invalid value'}}, valid_session
          response.should render_template('edit')
        end
      end
    end

    describe 'DELETE destroy' do
      let!(:test) { Test.create! valid_attributes }

      it 'destroys the requested test' do
        expect {
          delete :destroy, {:id => test.to_param}, valid_session
        }.to change(Test, :count).by(-1)
      end
    end
  end
end
