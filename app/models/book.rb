# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :author, optional: true

  validates :title, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :published_date, presence: true
end
