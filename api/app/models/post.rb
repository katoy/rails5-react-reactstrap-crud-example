# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  body       :string           not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :title, :body, presence: true
end
