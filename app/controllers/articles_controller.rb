class ArticlesController < ApplicationController
  
  layout 'header_footer'   
  before_action :define_privilege
  before_action :limit_access_for_users, :except => ['show']

	def show
		@article = Article.find(params[:id])
		@commentData = @article.comments
		@numOfComments = Comment.where(article_id: @article).length
		@user
		@userHash = {}
		@userHash[1] = "administrator"
		User.all.each do |i|
			@userHash[i.id] = i.username
		end
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		if @article.update_attributes(article_param)
			flash[:notice] = "Article updated"
			redirect_to(article_path)
		else
			render('edit')
		end
	end

	def new
		@article = Article.new()
	end

	def create
		article = Article.new(article_param)
		if article.save
			flash[:notice] = "Article created"
			redirect_to(root_path)
		else
			render('new')
		end
	end

	def delete
		@article = Article.find(params[:id])
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		flash[:notice] = "Article deleted"
		redirect_to(root_path)
	end
	
	private
	
	def define_privilege
		if session[:user_id] != nil && session[:user_id] != 1
			@user = User.find(session[:user_id]).username
			@privilege = false
		elsif session[:user_id] == 1
			@user = AdminUser.find(session[:user_id]).admin_name
			@privilege = true
		end
	end

	def limit_access_for_users
		unless @privilege
			redirect_to root_path
		end	
	end

	def article_param
		params.require(:article).permit(:title, :intro, :bodytag, :body)
	end
	

end
