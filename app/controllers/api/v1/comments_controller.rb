class Api::V1::CommentsController < Api::V1::BaseController
  before_action :authenticate_user!, only: [:create]

  def index
    project = Project.find(params[:project_id])
    comments = project.comments.includes(:user).order(created_at: :desc)

    render json: {
      comments: comments.map do |comment|
                  CommentSerializer.new(comment: comment).as_json
                end
    }
  end

  def create
    comment = current_user.comments.new(comment_params)

    if comment.save
      CommentMailer.with(comment: comment).new_comment_email.deliver_later
      render json: { comment: comment }
    else
      render json: comment.errors.full_messages[0], status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(project_id: params[:project_id])
  end
end
