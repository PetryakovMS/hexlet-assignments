class Task < ApplicationRecord
  belongs_to :user
  belongs_to :status
  validates :name, :status, :user, :description, presence: true
end
