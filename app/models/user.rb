class User < ApplicationRecord
  has_many :projects
  has_many :project_supports

  validates :uid, presence: true, uniqueness: true
  validates :name, presence: true
end
