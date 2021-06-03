class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  rescue_from UnauthenticatedError do
    render(status: :unauthorized, json: { message: 'Could not authenticate user.' })
  end

  def authenticate_token_by_firebase
    authenticate_with_http_token do |token, _|
      return { data: FirebaseAuth.verify_id_token(token) }
    rescue StandardError => e
      return { error: e.message }
    end

    { error: 'token invalid' }
  end

  def authenticate_user!
    raise UnauthenticatedError unless current_user
  end

  def current_user
    @current_user ||= begin
      @auth = authenticate_token_by_firebase
      @auth[:data] && User.find_by(uid: @auth[:data]['uid'])
    end
  end
end
