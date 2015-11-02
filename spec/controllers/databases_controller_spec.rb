require 'rails_helper'


RSpec.describe DatabasesController, type: :controller do
  let(:user) { build(:user) } 
 before do
    sign_in user
    controller.stub(:user_signed_in?).and_return(true)
    controller.stub(:current_user).and_return(user)
    controller.stub(:authenticate_user!).and_return(user)
    controller.current_user.stub(admin?: true)
  end

  let(:valid_attributes) do
    {
      name: 'MyString',
      comment: 'MyString',
      host: 'MyString',
      username: 'MyString',
      password: 'MyString',
      database: 'MyString',
      
    }
  end 

  let(:invalid_attributes) do
    {
      name: '',
      comment: '',
      host: 'MyString',
      username: 'MyString',
      password: 'MyString',
      database: 'MyString',
      
    }
  end 


  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all databases as @databases" do
      database = Database.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:databases)).to eq([database])
    end
  end


  describe "GET #new" do
    it "assigns a new database as @database" do
      get :new, {}, valid_session
      expect(assigns(:database)).to be_a_new(Database)
    end
  end

  describe "GET #edit" do
    it "assigns the requested database as @database" do
      database = Database.create! valid_attributes
      get :edit, {:id => database.to_param}, valid_session
      expect(assigns(:database)).to eq(database)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Database" do
        expect {
          post :create, {:database => valid_attributes}, valid_session
        }.to change(Database, :count).by(1)
      end

      it "assigns a newly created database as @database" do
        post :create, {:database => valid_attributes}, valid_session
        expect(assigns(:database)).to be_a(Database)
        expect(assigns(:database)).to be_persisted
      end

      
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved database as @database" do
        post :create, {:database => invalid_attributes}, valid_session
        expect(assigns(:database)).to be_a_new(Database)
      end

      it "re-renders the 'new' template" do
        post :create, {:database => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "assigns the requested database as @database" do
        database = Database.create! valid_attributes
        put :update, {:id => database.to_param, :database => valid_attributes}, valid_session
        expect(assigns(:database)).to eq(database)
      end

      it "redirects to the database" do
        database = Database.create! valid_attributes
        put :update, {:id => database.to_param, :database => valid_attributes}, valid_session
        expect(response).to redirect_to(databases_url)
      end
    end

    context "with invalid params" do
      it "assigns the database as @database" do
        database = Database.create! valid_attributes
        put :update, {:id => database.to_param, :database => invalid_attributes}, valid_session
        expect(assigns(:database)).to eq(database)
      end

      it "re-renders the 'edit' template" do
        database = Database.create! valid_attributes
        put :update, {:id => database.to_param, :database => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested database" do
      database = Database.create! valid_attributes
      expect {
        delete :destroy, {:id => database.to_param}, valid_session
      }.to change(Database, :count).by(-1)
    end

    it "redirects to the databases list" do
      database = Database.create! valid_attributes
      delete :destroy, {:id => database.to_param}, valid_session
      expect(response).to redirect_to(databases_url)
    end
  end

end
