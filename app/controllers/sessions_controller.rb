class SessionsController < ApplicationController
  def new
  end
  def create
    # render 'new'
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # login the user in and redirect to user's show page
      log_in(user)
      redirect_to user
    else
      flash.now[:danger] = "invalid your email or password..."
      render 'new'
    end
  end
  def destroy
    log_out
    redirect_to root_url # dua ve page home
  end

end
