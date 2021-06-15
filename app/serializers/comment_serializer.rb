class CommentSerializer
  def initialize(comment:)
    @comment = comment
  end

  def as_json
    {
      id: @comment.id,
      body: @comment.body,
      user: {
        name: @comment.user.name
      }
    }
  end
end
