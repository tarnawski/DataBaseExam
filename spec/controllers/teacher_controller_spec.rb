require 'rails_helper'

RSpec.describe TeacherController, type: :controller do
  let(:valid_attributes) do
    {
    firstname: 'John',
    lastname: 'Doe',
    email: 'nickname@o2.pl',
    password: 'password123'
    }
  end

  let(:user) { build(:user) }


  before do
    sign_in user
    controller.stub(:user_signed_in?).and_return(true)
    controller.stub(:current_user).and_return(user)
    controller.stub(:authenticate_user!).and_return(user)
  end

    before do
      controller.current_user.stub(admin?: true)
      controller.current_user.stub(super_admin: true)
    end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #promote" do
    it "redirect to teacher page" do
      student = User.create!  valid_attributes
      student.save
      get :promote, { id: student.id }
      expect(User.find(student.id).admin).to eq(true)
      expect(response).to redirect_to(teacher_index_path)
      flash[:notice].should eql("Uprawnienia zostały dodane")
      
    end
  end

  describe "GET #downgrade" do
    it "redirect to teacher page" do
      admin = User.create!  valid_attributes
      admin.save
      get :downgrade, { id: admin.id }
      expect(User.find(admin.id).admin).to eq(false)
      expect(response).to redirect_to(teacher_index_path)
      flash[:notice].should eql("Uprawnienia zostały odebrane")
    end
  end

end
