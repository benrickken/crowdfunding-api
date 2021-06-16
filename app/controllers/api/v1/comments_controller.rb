class Api::V1::CommentsController < Api::V1::BaseController
  before_action :authenticate_user!, only: [:create]
  before_action :set_project, only: %i[index create]

  def index
    comments = @project.comments.includes(:user).order(created_at: :desc)

    render json: {
      comments: comments.map do |comment|
                  CommentSerializer.new(comment: comment).as_json
                end
    }
  end

  def create
    comment = current_user.comments.new(comment_params)
    comment.project = @project

    if comment.save
      render json: { comment: comment }
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
