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
		puts "before the first if statement"
		puts params.inspect
		if params[:admin_name].present? && params[:password].present?
			puts "inside the first if statement"
  		found_user = AdminUser.where(:admin_name => params[:admin_name]).first
  		if found_user
  			authorized_user = found_user.authenticate(params[:password])
  		end
  	end
  	puts "after the first if statement"
  	if authorized_user
  		puts "inside the second if statement"
  		session[:user_id] = authorized_user.id
  		flash.now[:notice] = "You are loged in"
  		redirect_to(admins_menu_path)
  	else
  		puts "inside else statement"
  		flash.now[:notice] = "Invalid Authentication"
  		# redirect_to(access_login_path)
      redirect_to(admins_login_path)
    end
	end

	def logout
		session[:user_id] = nil
		render('login')
	end

  private

  def confirm_login
    unless session[:user_id]
      flash[:notice] = "Please login."
      redirect_to admins_login_path
    end
  end

end
