class CommentSerializer
  def initialize(comment:)
    @comment = comment
  end

  def as_json
    {
      id: @comment.id,
      body: @comment.body,
      createdAt: @comment.created_at,
      user: {
        name: @comment.user.name
      }
    }
  end
end
