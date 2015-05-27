require 'rails_helper'

RSpec.describe AnswersController, type: :controller do


describe 'GET edit' do
    it 'expose the requested product' do
      
      get :new
expect(response).to redirect_to(show)
    end
  end




end

