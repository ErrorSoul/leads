require 'spec_helper'
require 'pry'

describe UsersController do
  let!(:user) {FactoryGirl.build(:user)}
  let!(:bad_user) {FactoryGirl.build(:invalid_user_email)}

  describe "POST create new user" do 
    context " with valid params " do
      it "should return registration complete" do
        post :create, user: FactoryGirl.attributes_for(:user)
        expected_json = {message: ["registration complete"]}.to_json
        expect(response.body).to eq expected_json
      end
    end
  end


  describe "POST create new user with no email" do 
    it "should return bad message" do
     
      post :create, user: FactoryGirl.attributes_for(:invalid_user_email)
      #pry.binding
      expected_json = {message: ["Email can't be blank", "Email is invalid"]}.to_json
      expect(response.body).to eq expected_json
    end
  end

  describe "POST create user that already exist " do
    it "should return 'Email has already been taken'" do
      post :create, user: FactoryGirl.attributes_for(:user)
      post :create, user: FactoryGirl.attributes_for(:user)
      expected_json = {message: ["Email has already been taken"]}.to_json
      expect(response.body).to eq expected_json
    end
  end

end
