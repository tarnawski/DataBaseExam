require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  let(:user) { build(:user) }  
  let(:test)      { create(:test) }
  let(:valid_attributes) do
    {
      content: 'MyString',
      query: 'MyString',
      test_id: test.id,
    }
  end

  before do
    sign_in user
    controller.stub(:user_signed_in?).and_return(true)
    controller.stub(:current_user).and_return(user)
    controller.stub(:authenticate_user!).and_return(user)
  end


  context 'user is not admin' do
    before do
      controller.current_user.stub(admin?: false)
    end

    describe 'GET show' do
        it 'redirects user to test path' do
          get :new, {id: valid_attributes, test_id: test.to_param }
          expect(response).to redirect_to(tests_path)
        end
    end
    describe 'GET edit' do
        it 'redirects user to test path' do
          get :edit, {id: valid_attributes, test_id: test.to_param }
          expect(response).to redirect_to(tests_path)
        end
    end

    describe 'GET destroy' do
        it 'redirects user to test path' do
          delete :destroy, {id: valid_attributes, test_id: test.to_param }
          expect(response).to redirect_to(tests_path)
        end
    end
  end  
end
