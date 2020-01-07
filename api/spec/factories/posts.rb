# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    sequence(:title) { |n| "title_#{n}" }
    sequence(:body) { |n| "body_#{n}" }
  end
end
