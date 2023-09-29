class SessionsController < ApplicationController
    # GET /sessions
    def sign
    end
 
    # POST /sessions
    def enter
        user = User.find_by(email: params[:email])
        # if user.present? && user.authenticate(params[:password])
        if user.present? && user.password == :password
            session[:user_id] = user.id
            redirect_to root_path, notice: "Logged in successfully"
        else
            flash[:alert] = "Invalid email or password"
            render :sign
        end
    end

    #DELETE /logout
    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "Logged out"
    end
end