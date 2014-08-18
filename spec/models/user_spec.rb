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

  describe "when email address is already taken " do 
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end
    it {should_not be_valid}
  end
 


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

  describe "when password is too short" do
    before {@user.password = '2'}
    it {should_not be_valid}
  end


  describe "when email format is invalid" do 
    it "should be invalid" do 
      addresses =  %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do  |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end 
  end
  

  describe "email address with mixed case" do
    let(:mixed_case_email) { "Foo@ExAMPle.CoM" }

    it "should be saved as all lower-case" do
      @user.email = mixed_case_email
      @user.save
      expect(@user.reload.email).to eq mixed_case_email.downcase
    end
  end

  describe "when email format is valid" do
    it "should be valid" do 
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address 
        expect(@user).to be_valid
      end
    end
  end
end


