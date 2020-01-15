# frozen_string_literal: true

class HomeController < ActionController::Base
  include ActionController::RequestForgeryProtection
  include ActionController::ImplicitRender
  include ActionView::Layouts

  layout 'application'

  def index
    render html: "This is home page."
  end
end
