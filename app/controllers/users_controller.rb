class UsersController < ApplicationController
  before_action :authenticate_user!
  before_create :generate_authentication_token

  def generate_authentication_token
    loop do
      self.authentication_token = SecureRandom.base64(64)
      break unless User.find_by(authentication_token: authentication_token)
    end
  end
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
