require 'rails_helper'

RSpec.describe SqlboxController, type: :controller do
  let(:user) { build(:user) }
  before do
    sign_in user
    controller.stub(:user_signed_in?).and_return(true)
    controller.stub(:current_user).and_return(user)
    controller.stub(:authenticate_user!).and_return(user)

  end

  context 'user is not an admin' do
    before do
      controller.current_user.stub(admin?: true)
    end
    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end

  context 'user is not an admin' do
    before do
      controller.current_user.stub(admin?: false)
    end

    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to redirect_to(tests_path)
      end
    end
  end
end
