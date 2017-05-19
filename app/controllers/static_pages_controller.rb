class StaticPagesController < ApplicationController

	def index
		@articles = Article.all.order('created_at DESC').paginate(:per_page =>2, :page => params[:page])
	end

	def services
		
	end

	def about
		
	end
end
