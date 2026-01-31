# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { 'Sample Book Title' }
    author { 'Sample Author' }
    price { 19.99 }
    published_date { Date.new(2024, 1, 15) }
  end
end
