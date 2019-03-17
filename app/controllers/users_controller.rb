class UsersController < ApplicationController
  before_action :get_user, only: %i[show]

  def create
    @user = User.create!(user_params)
    @session = Session.signin!(@user, request.ip)
  end

  def show
  end

  private
    def user_params
      params.permit(:handle, :password, :password_confirmation,
                    :location, :telephone, :email)
    end

    def get_user
      @user = User.find(params[:id])
    end
end
