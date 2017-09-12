class WelcomeController < ApplicationController
  
  layout 'header_footer'

  def index
  	@article = Article.all
  end

end
