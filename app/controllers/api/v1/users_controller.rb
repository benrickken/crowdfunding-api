class Api::V1::UsersController < ApplicationController
  before_action :set_auth, only: %i[create]

  def create
    render json: @auth, status: :unauthorized and return unless @auth[:data]

    uid = @auth[:data]['uid']
    user = User.new(user_params.merge(uid: uid))
    if user.save
      render json: { message: '登録が成功しました' }
    else
      render json: user.errors.messages, status: :unprocessable_entity
    end
  end

  private

  def set_auth
    @auth = authenticate_token_by_firebase
  end

  def user_params
    params.require(:user).permit(:name)
  end
end
