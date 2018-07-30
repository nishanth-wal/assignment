require 'rails_helper'

RSpec.describe Users::SessionsController, type: :controller do
  before do 
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end
  let!(:user) { create(:user) }

  context "POST #sign_in" do
    example "user should be sign in if email/password if correct" do
      post :create, params: { email: user.email, password: '123456' }, format: :json

      expect(response).to have_http_status(200)

      resp = JSON.parse(response.body)
      # expect(resp["token"]).not_to be_nil
    end

    example "user should not be sign in if email/password are incorrect" do
      post :create, params: { email: user.email, password: 'hellosssser' }, format: :json

      expect(response).to have_http_status(422)
    end
  end
end