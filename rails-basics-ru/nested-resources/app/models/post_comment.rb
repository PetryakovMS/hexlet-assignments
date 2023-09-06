# frozen_string_literal: true

class PostComment < ApplicationRecord
  # BEGIN
  belongs_to :post
  # END

  validates :title, presence: true
  validates :body, length: { maximum: 500 }
end
