class UsersController < ApplicationController
	

	def login
		
	end

  def register
    
  end

	def attempt_login
		if params[:username].present? && params[:password].present?
  	   found_user = User.where(:username => params[:username]).first
  		if found_user
  			authorized_user = found_user.authenticate(params[:password])
  		end
  	end
    val = params[:article_id]
  	if authorized_user
  		session[:user_id] = authorized_user.id
      if params[:article_id] != nil
        val = params[:article_id]
        redirect_to(article_path(val))
      else
        redirect_to welcome_index_path
      end
      
  	else
  		flash[:notice] = "Invalid Authentication"
      redirect_to(users_login_path(val))
    end
	end

  def attempt_register
    if params[:username].present? && params[:password].present? && params[:email].present?
      user_already_exists = User.where(:username => params[:username]).first
      if user_already_exists
        flash[:notice] = "Choose another username"
        redirect_to(users_register_path)
      else
        new_user = User.create("username" => params[:username], "email" => params[:email], "password" => params[:password])
      end
      if new_user
        session[:user_id] = new_user.id
        redirect_to(welcome_index_path)
      end
    end
  end

	def logout
		session[:user_id] = nil
		redirect_to welcome_index_path
	end

  def create
    @user = User.new()
  end

  def update
    
  end

end
