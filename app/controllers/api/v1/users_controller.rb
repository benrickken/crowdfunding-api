class Api::V1::UsersController < Api::V1::BaseController
  def create
    auth = authenticate_token_by_firebase
    raise UnanthenticatedError unless auth[:data]

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
    params.require(:user).permit(:name, :email)
  end
end
