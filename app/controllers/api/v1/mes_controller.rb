class Api::V1::MesController < Api::V1::BaseController
  before_action :authenticate_user!

  def show
    render json: UserSerializer.new(user: current_user).as_json
  end

  def notifications
    notifications = current_user.notifications.order(created_at: :desc)
    render json: {
      notifications: notifications.map { |notification| NotificationSerializer.new(notification: notification).as_json }
    }
  end

  def read_notifications
    current_user.notifications.unread.update_all(status: :read, updated_at: Time.zone.now)
    head :ok
  end

  def projects
    render json: {
      projects: current_user.projects.query_for_serializer.map { |project| ProjectSerializer.new(project: project).as_json }
    }
  end

  def backed_projects
    backed_projects = current_user.backed_projects.query_for_serializer

    render json: {
      backedProjects: backed_projects.map do |project|
                        ProjectSerializer.new(project: project).as_json
                      end
    }
  end
end
