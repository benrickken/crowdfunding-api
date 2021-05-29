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
      completeFlag: @project.complete_flag,
      supportersCount: @project.project_supports.count,
      supportedAmount: @project.supported_amount,
      imageUrl: @project.image_url,
      user: {
        name: @project.user.name
      }
    }
  end
end
