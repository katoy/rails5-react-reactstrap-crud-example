# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  body       :string(1024)     not null
#  title      :string(256)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :title, :body, presence: true
  validates :title, length: { maximum: 256 }
  validates :body, length: { maximum: 1024 }
end
