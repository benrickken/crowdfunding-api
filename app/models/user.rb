class User < ApplicationRecord
  # has_many :projects
  has_many :project_supports
  has_many :project_returns, through: :project_supports
  has_many :backed_projects, through: :project_returns, source: :project
  has_many :comments
  has_many :notifications
  has_many :favorites
  has_many :projects, through: :favorites, source: :project

  validates :uid, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
