module Authenticatable
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user!
  end

  def authenticate_user!
    render json: { message: 'Could not find user.' }, status: :unauthorized and return unless current_user.present?
  end

  def current_user
    @current_user ||= begin
      @auth = authenticate_token_by_firebase
      @auth[:data] && User.find_by(uid: @auth[:data]['uid'])
    end
  end
end
