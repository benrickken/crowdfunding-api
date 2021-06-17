class Api::V1::MesController < Api::V1::BaseController
  before_action :authenticate_user!

  def show
    render json: UserSerializer.new(user: current_user).as_json
  end

  def notifications
    render json: {
      notifications: current_user.notifications.map { |notification| NotificationSerializer.new(notification: notification).as_json }
    }
  end

  def projects
    render json: {
      projects: current_user.projects.map { |project| ProjectSerializer.new(project: project).as_json }
    }
  end

  def backed_projects
    backed_projects = current_user.backed_projects.includes(:user).distinct

    render json: {
      backedProjects: backed_projects.map do |project|
                        ProjectSerializer.new(project: project).as_json
                      end
    }
  end
end
