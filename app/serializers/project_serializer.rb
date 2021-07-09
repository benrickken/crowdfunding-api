class ProjectSerializer
  def initialize(project:)
    @project = project
  end

  def as_json
    {
      id: @project.id,
      title: @project.title,
      targetAmount: @project.target_amount,
      dueDate: @project.due_date,
      description: @project.description,
      progress: @project.progress,
      supportersCount: @project.project_supports_count,
      supportedAmount: @project.project_supports_total_price,
      favoritedCount: @project.favorites_count,
      imageUrl: @project.image_url,
      user: {
        name: @project.user.name
      }
    }
  end
end
