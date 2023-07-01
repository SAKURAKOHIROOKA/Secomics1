class ComicsController < ApplicationController
  
  def index
    @user = current_user
    
    @comics = Comic.page(params[:page]).reverse_order
  end

  def show
    @user = current_user
    
    @comic = Comic.find(params[:id])
    @comic_user = @comic.user
    
    @post_comment = PostComment.new
    
  end

  def new
    @comic = Comic.new
  end
  
  def create
    @user = current_user
    @comics = Comic.all
    @comic = Comic.new(comic_params)
    @comic.user_id = current_user.id
    if @comic.save
       redirect_to comic_path(@comic.id), notice: 'You have created book successfully.'
    else
    render :index
    end
  end 

  def edit
    @comic = Comic.find(params[:id])
  end
  
  def update
    @comic = Comic.find(params[:id])
    if @comic.update(comic_params)
    redirect_to comic_path(@comic.id),notice: 'You have updated book successfully.'
    else
      render :edit
    end
  end 
  
  def destroy
    comic = Comic.find(params[:id])
    comic.destroy
    redirect_to comics_path
  end 
  
   private
  
  def comic_params
    params.require(:comic).permit(:title, :story, :review, :user_id)
  end 
  
  def correct_user
    @comic= Comic.find(params[:id])
    @user = @comic.user
    redirect_to comics_path unless @user == current_user
  end 
end
