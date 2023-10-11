class SessionsController < ApplicationController
    # GET /sessions
    def sign
    end
 
    # POST /sessions
    def enter
        user = User.find_by(email: params[:email])
        if user.present? && user.password == params[:password]
            session[:user_id] = user.id
            
            redirect_to root_path, notice: "Logged in successfully"
        else
            flash[:alert] = "Invalid email or password"
            redirect_to sessions_path
        end
    end

    #DELETE /sessions
    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "Logged out"
    end
end
