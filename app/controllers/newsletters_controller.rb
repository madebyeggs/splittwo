class NewslettersController < ApplicationController
  layout "newsletter_layout"

  def index
    define_newsletters
  end

end