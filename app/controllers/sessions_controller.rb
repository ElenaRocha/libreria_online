class SessionsController < ApplicationController
    # GET /sessions
    def sign
    end
 
    # POST /sessions
    def enter
        user = User.find_by(email: params[:email])
        # if user.present? && user.password == params[:password]
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: "Logged in successfully"
        else
            flash[:alert] = "Invalid email or password"
            redirect_to sessions_path
        end
    end

    # DELETE /sessions
    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "Logged out"
    end

  # def forgot_password
  #   @user = User.find_by_email(params[:email])
  #   random_password = Array.new(10).map { (65 + rand(58)).chr }.join
  #   @user.password = random_password
  #   @user.save!
  #   Mailer.create_and_deliver_password_change(@user, random_password)
  # end
end
