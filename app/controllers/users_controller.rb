class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @books = Book.where(user_id: params[:id])
    @book = Book.new
  end

  def index
    @users = User.all
    @book = Book.new
  end

  def edit
    @user_update = User.find(params[:id])
  end

  def update
    @user_update = User.find(params[:id])
    if @user_update.update(user_params)
      flash[:notice] = "You have update user successfully."
      redirect_to user_path(@user_update.id)
    else
      #@user = User.find(params[:id])
      render :edit
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction )
  end


end
