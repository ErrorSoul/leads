require 'spec_helper'

describe User do
  before do 
    @user = User.new(first_name:"Tamara", last_name:"Smith", email:"carap100@yandex.ru", birthdate: "/Date('1111112120')/", country: "46", password: "alien1")
  end

  subject {@user} 
  it {should respond_to(:first_name)}
  it {should respond_to(:last_name)}
  it {should respond_to(:country)}
  it {should respond_to(:birthdate)}
  it {should respond_to(:email)}
  it {should respond_to(:password)}
  it {should be_valid}
 


  describe "when first_name is not present" do
    before { @user.first_name = ' '}
    it { should_not be_valid}
  end

  describe "when last_name is not present" do
    before { @user.last_name = ' '}
    it { should_not be_valid}
  end
  

  describe "when password is not present" do
    before { @user.password = ' '}
    it { should_not be_valid}
  end

  describe "when birthday is not present" do
    before { @user.birthdate = ' '}
    it { should_not be_valid}
  end


  describe "when country  is not present" do
    before { @user.country = ' '}
    it { should_not be_valid}
  end


   describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end
end


