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
      supportersCount: @project.project_supports.count,
      supportedAmount: @project.supported_amount,
      user: {
        name: @project.user.name
      }
    }
  end
end
