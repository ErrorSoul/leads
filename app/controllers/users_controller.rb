
class UsersController < ApplicationController
  respond_to :json
  #after_action :message, only: [:create]


  def create
    @user = User.new(user_params)
    if @user.save
      @user.delay.mess
      render json: { message: ["registration complete"]}
    else
      render json: {message: @user.errors.full_messages}
    end
  end
 

 
   
    private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :birthdate, :email, :country, :password)
    end
end
