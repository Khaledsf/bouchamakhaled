class AdminsController < ApplicationController
  
  layout 'admin_display'

  before_action :confirm_login, :except => [:login, :attempt_login, :logout]

	def manage_articles
    @article = Article.all
  end
  
  def menu
	  
	end

	def login

	end

	def attempt_login
		if params[:admin_name].present? && params[:password].present?
  		found_user = AdminUser.where(:admin_name => params[:admin_name]).first
  		if found_user
  			authorized_user = found_user.authenticate(params[:password])
  		end
  	end
  	if authorized_user
  		session[:user_id] = authorized_user.id
  		flash.now[:notice] = "You are loged in"
  		redirect_to(admins_menu_path, admin_name: "administrator")
  	else
  		flash.now[:notice] = "Invalid Authentication"
      redirect_to(admins_login_path)
    end
	end

	def logout
		session[:user_id] = nil
		render('login')
	end

  private

  def confirm_login
    
    unless session[:user_id] == 1
      flash[:notice] = "Please login."
      redirect_to admins_login_path
    end
  end

end
