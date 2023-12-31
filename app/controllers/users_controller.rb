class UsersController < ApplicationController
  
  def index
    @user = current_user
    @users = User.page(params[:page]).reverse_order
    @comic = Comic.new
  end

  def show
    @user = User.find(params[:id])
    
    @comics = @user.comics.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end
  
   def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path, notice: 'You have updated user successfully.'
    else
      render :edit
    end
   end
   
    private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end 
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user.id) unless @user == current_user
  end 
   
end
