class UsersController < ApplicationController
  before_action :authorize_session, only: %i[profile]

  def create
    @user = User.create!(user_params)
    @session = Session.signin!(@user, request.ip)
  end

  def profile
    @user = current_user
  end

  private
    def user_params
      params.permit(:handle, :password, :password_confirmation,
                    :location, :telephone, :email)
    end
end
