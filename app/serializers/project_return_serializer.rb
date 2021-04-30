class ProjectReturnSerializer
  def initialize(project_return:)
    @project_return = project_return
  end

  def as_json
    {
      id: @project_return.id,
      price: @project_return.price,
      capacity: @project_return.capacity,
      deliveryDate: @project_return.delivery_date,
      description: @project_return.description,
    }
  end
end
