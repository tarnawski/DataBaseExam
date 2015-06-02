require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  let(:test)      { create(:test) }
  let(:valid_attributes) do
    {
      content: 'MyString',
      query: 'MyString',
      test_id: test.id,
    }
  end


  context 'user is not singed in' do


   describe 'GET index' do
        it 'redirects user to login page' do
          get :index, { test_id: test.to_param }
          expect(response).to redirect_to(new_user_session_path)
        end
     end
  

   describe 'GET show' do
        it 'redirects user to login page' do
          get :show, {id: valid_attributes, test_id: test.to_param }
          expect(response).to redirect_to(new_user_session_path)
        end
     end
   end


  context 'user is not singed in but not admin' do

  let(:user) { build(:user) }

  before do
    sign_in user
    controller.stub(:user_signed_in?).and_return(true)
    controller.stub(:current_user).and_return(user)
    controller.stub(:authenticate_user!).and_return(user)
  end

   

   describe 'GET index' do
        it 'redirects user to test list' do
          get :index, { test_id: test.to_param }
          expect(response).to redirect_to(tests_path)
        end
     end
  

   describe 'GET show' do
        it 'redirects user to test list' do
          get :show, {id: valid_attributes, test_id: test.to_param }
          expect(response).to redirect_to(tests_path)
        end
     end
  end
  

 context 'user is an admin' do
    before do
      controller.current_user.stub(admin?: true)
    end

  describe 'GET show' do
    it 'expose the requested question' do
      question = Question.create! valid_attributes
      get :show, { id: question.to_param, test_id: question.to_param }
      expect(controller.question).to eq(question)
    end
  end

end
end
