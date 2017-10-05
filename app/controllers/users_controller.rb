class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    authenticate_user
    @message = params[:message]
  end

  def new
    if !logged_in?
      @user = User.new
    else
      redirect_to "/users/#{current_user.id}"
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Welcome to the theme park!"
    else
      redirect_to new_user_path, notice: 'Something went wrong. Please fill out all fileds correctly.'
    end
  end

  def edit
  end

  def update

  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :password,
      :height,
      :tickets,
      :happiness,
      :nausea,
      :admin
      )
  end

end
