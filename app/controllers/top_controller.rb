class TopController < ApplicationController
  def index
  	@articles = Article.open.readable_for(current_member).order("released_at DESC").limit(5)
  end
  def about
  	#"何もしない"
  end
end
