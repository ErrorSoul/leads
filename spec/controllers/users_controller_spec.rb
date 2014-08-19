require 'spec_helper'

describe UsersController do
  let!(:user) {FactoryGirl.build(:user)}

  describe "POST create new user" do 
    context " with valid params " do
      it "should return registration complete" do
        post :create, user: FactoryGirl.attributes_for(:user)
        expected_json = {message: "registration complete"}.to_json
        expect(response.body).to eq expected_json
      end
    end
  end


  describe "POST create new user with no email" do 
    it "should return bad message" do
      user.email = ""
      post :create, user: FactoryGirl.attributes_for(:invalid_user_email)
      expected_json = {message: "bad message"}.to_json
      expect(response.body).to eq expected_json
    end
  end

    

end
