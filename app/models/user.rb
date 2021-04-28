class User < ApplicationRecord
  has_many :projects

  validates :uid, presence: true, uniqueness: true
  validates :name, presence: true
end
