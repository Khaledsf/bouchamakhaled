class CommentsController < ApplicationController
  # requires admin login.
  # when users are loged in, they can on create a 'new' comment.
  
  def index
  end

  def edit
  end

  def show
  end

  def new
    @comment = Comment.new()
  end

  def create
    puts user_params
    @comment  = Comment.new(user_params)
    if @comment.save
      redirect_to article_path(params[:comment][:article_id])
    else
      redirect_to articles_path
    end
  end

  def delete
  end

  private

  def user_params
    params.require(:comment).permit(:article_id, :user_id, :content)
  end

end