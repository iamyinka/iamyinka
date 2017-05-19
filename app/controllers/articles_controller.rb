class ArticlesController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :find_article, only: [:show, :edit, :update, :destroy]

	def index
		@articles = Article.all.order('created_at DESC').paginate(:per_page =>4, :page => params[:page])
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)

		if @article.save
			flash[:success] = "Article has been successfully Posted!"
			redirect_to @article
		else
			flash[:danger] = "Please check error(s) marked red!"
			render 'new'
		end
	end

	def show
		
	end

	def edit
		
	end

	def update
		
		if @article.update(article_params)
			flash[:success] = "Article has been successfully updated!"
			redirect_to @article
		else
			flash[:danger] = "Please check error(s) marked red!"
			render 'edit'
		end
	end

	def destroy
		@article.destroy
		flash[:success] = "Article has been successfully deleted!"
		redirect_to articles_path
	end

private

	def article_params
		params.require(:article).permit(:title, :description)
	end

	def find_article
		@article = Article.find(params[:id])
	end
end
