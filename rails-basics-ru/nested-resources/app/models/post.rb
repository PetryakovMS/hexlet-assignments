# frozen_string_literal: true

class Post < ApplicationRecord
  # BEGIN
  has_many :post_comment
  # END

  validates :title, presence: true
  validates :body, length: { maximum: 500 }
end
