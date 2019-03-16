class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :error_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :error_invalid
  rescue_from ActiveRecord::RecordNotUnique, with: :error_invalid

  def error_not_found(exception)
    render status: :not_found, json: { error: exception.message }
  end

  def error_invalid(exception)
    render status: 422, json: { error: exception.message }
  end

  def auth_token
    request.headers['HTTP_AUTHORIZATION']
  end

  def signed_in?
    Session.where(token: auth_token).where('expire_at > ?', DateTime.now.utc).first.present?
  end

  def current_user
    Session.where(token: auth_token).where('expire_at > ?', DateTime.now.utc).first&.user
  end

  protected
    def authorize_session
      return unless signed_in?
    end
end
