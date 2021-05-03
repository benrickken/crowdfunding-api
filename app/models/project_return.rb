class ProjectReturn < ApplicationRecord
  belongs_to :project
  has_many :project_supports
end
