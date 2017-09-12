class UsersController < ApplicationController
	

	def login
		
	end

  def register
    
  end

	def attempt_login
		puts "hello first params inside attempt login: #{params}"
		if params[:username].present? && params[:password].present?
			puts "inside the first if statement"
  		found_user = User.where(:username => params[:username]).first
  		if found_user
  			authorized_user = found_user.authenticate(params[:password])
  		end
  	end
  	puts "This is params[:article_id]: #{params[:article_id]}"
    val = params[:article_id]
  	if authorized_user
  		session[:user_id] = authorized_user.id
      if params[:article_id] != nil
        val = params[:article_id]
        redirect_to(article_path(val))
      else
        puts "this val = article_id: #{val.inspect}"
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
        puts "this is session user id: #{session[:user_id]}"
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
