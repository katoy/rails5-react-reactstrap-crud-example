# frozen_string_literal: true

Post.seed do |s|
  s.id = 1
  s.title = "title_00"
  s.body = "これは 00 です。"
end

Post.seed do |s|
  s.id = 2
  s.title = "title_01"
  s.body = "これは 01 です。"
end
