require 'rails_helper'

RSpec.describe ResultsController, type: :controller do
 let(:test)      { create(:test) }
  let(:user) { build(:user) }

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


   describe 'GET index' do
        it 'redirects user to test path' do
          get :index, { test_id: test.to_param }
          expect(response).to redirect_to(tests_path)
        end
     end

   

end
end
