class Api::V1::CommentsController < Api::V1::BaseController
  def index
    project = Project.find(params[:id])
    comments = project.comments

    render json: {
      comments: comments.map do |comment|
                  CommentSerializer.new(comment: comment).as_json
                end
    }
  end
end
