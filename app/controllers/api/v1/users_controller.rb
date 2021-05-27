class Api::V1::UsersController < ApplicationController
  def create
    auth = authenticate_token_by_firebase
    render json: auth, status: :unauthorized and return unless auth[:data]

    uid = auth[:data]['uid']
    user = User.new(user_params.merge(uid: uid))
    if user.save
      render json: { message: '登録が成功しました' }
    else
      render json: user.errors.messages, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
