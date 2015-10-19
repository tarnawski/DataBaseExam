require 'rails_helper'

RSpec.describe ResultsController, type: :controller do
  let(:test)      { create(:test) }
  let(:user) { build(:user) }
  let(:valid_session) { {} }
  let(:valid_attributes) do
    {
      points: 5,
      mark: 3,
      student_id: user.id,
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
    describe 'GET index' do
        it 'redirects user to test path' do
          get :index, { test_id: test.to_param }
          expect(response).to redirect_to(tests_path)
        end
    end
    describe 'GET show' do
        it 'redirects user to test path' do
	  result = Result.create! valid_attributes
          get :show, { test_id: test.to_param, id: result.id }
          expect(response).to redirect_to(tests_path)
        end
    end
    describe 'GET edit' do
        it 'redirects user to test path' do
	  result = Result.create! valid_attributes
          get :edit, { test_id: test.to_param, id: result.id }
          expect(response).to redirect_to(tests_path)
        end
    end
    describe 'GET update' do
        it 'redirects user to test path' do
	  result = Result.create! valid_attributes
          put :update, { test_id: test.to_param, id: result.id }
          expect(response).to redirect_to(tests_path)
        end
    end
    describe 'GET destroy' do
        it 'redirects user to test path' do
	  result = Result.create! valid_attributes
          delete :destroy, { test_id: test.to_param, id: result.id }
          expect(response).to redirect_to(tests_path)
        end
    end
  end

  context 'user is admin' do
    before do
      controller.current_user.stub(admin?: true)
    end
    describe 'GET index' do
        it 'redirects user to test path' do
          get :index, { test_id: test.to_param }
        expect(response).to have_http_status(:success)
        end
    end

    describe 'GET show' do
        it 'redirects user to test path' do
	  result = Result.create! valid_attributes
          get :show, { test_id: test.to_param, id: result.id }
        expect(response).to have_http_status(:success)
        end
    end

    describe 'GET edit' do
        it 'redirects user to test path' do
	  result = Result.create! valid_attributes
          get :edit, { test_id: test.to_param, id: result.id }
        expect(response).to have_http_status(:success)
        end
    end

    describe "DELETE #destroy" do
      it "destroys the requested results" do
	  result = Result.create! valid_attributes
        expect {
          delete :destroy, {test_id: test.to_param, id: result.id }, valid_session
        }.to change(Result, :count).by(-1)
      end
    end
  end
end
