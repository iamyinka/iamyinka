class CommentsController < ApplicationController
	before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
	before_action :find_article
	before_action :find_comment, only: [:edit, :update, :destroy]
	
	def create
		@comment = @article.comments.create(comment_params)
		@comment.user_id = current_user.id

		if @comment.save
			flash[:success] = "Comment successfully posted!"
			redirect_to article_path(@article)
		else
			flash[:danger] = "Please check error(s) marked red!"
			render 'new'
		end
	end

	def edit
		
	end

	def update
		if @comment.update(comment_params)
			flash[:success] = "Comment has been updated successfully"
			redirect_to article_path(@article)
		else
			flash[:danger] = "Please check error(s) marked red!"
			render 'edit'
		end
	end

	def destroy
		@comment.destroy
		flash[:success] = "Comment has been successfully deleted!"
		redirect_to article_path(@article)
	end

	private

	def comment_params
		params.require(:comment).permit(:content)
	end

	def find_article
		@article = Article.find(params[:article_id])
	end

	def find_comment
		@comment = @article.comments.find(params[:id])
	end
end
