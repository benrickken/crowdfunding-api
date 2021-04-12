class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  def authenticate_token_by_firebase
    authenticate_with_http_token do |token, _|
      return { data: FirebaseAuth.verify_id_token(token) }
    rescue StandardError => e
      return { error: e.message }
    end

    { error: 'token invalid' }
  end
end
