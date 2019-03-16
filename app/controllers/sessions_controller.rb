class SessionsController < ApplicationController
  def create
    user = User.find_by!(handle: params[:handle]).try(:authenticate, params[:password])
    @session = Session.signin!(user, request.ip)
  end
end
