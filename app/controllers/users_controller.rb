class UsersController < ApplicationController
  def create
    @user = User.create(user_params)
    @session = Session.login(@user, request.ip)
  end

  private
    def user_params
      params.permit(:handle, :password, :password_confirmation,
                    :location, :telephone, :email)
    end
end
