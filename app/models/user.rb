class User < ApplicationRecord
  has_many :projects
  has_many :project_supports
  has_many :project_returns, through: :project_supports
  has_many :backed_projects, through: :project_returns, source: :project

  validates :uid, presence: true, uniqueness: true
  validates :name, presence: true
end
