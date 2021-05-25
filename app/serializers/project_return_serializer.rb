class ProjectReturnSerializer
  def initialize(project_return:, user:)
    @project_return = project_return
    @user = user
  end

  def as_json
    {
      id: @project_return.id,
      price: @project_return.price,
      capacity: @project_return.capacity,
      deliveryDate: @project_return.delivery_date,
      description: @project_return.description,
      supportersCount: @project_return.project_supports.count,
      isCreatedByMe: @project_return.project.user.id == @user.try(:id),
      isSupportedByMe: ProjectSupport.exists?(project_return: @project_return, user: @user)
    }
  end
end
