class CatsController < ApplicationController

  def show
    chack_ed
  end
  def edit
    chack_ed
  end

  def create
    chack_ed
      @category = Cat.new(category_params)
      if @category.save &&session[:user_id]==current_user && session[:status_user]==1
        redirect_to category_path
      else
        render 'show'
      end
  end


  def update
    chack_ed
    @categor=Cat.find(params[:id])
      if @categor.update(category_params)&&session[:user_id]==current_user && session[:status_user]==1
        redirect_to category_path
      else
        render 'edit'
      end
  end

  def destroy
    chack_ed
      if Cat.delete(params[:format]) &&session[:user_id]==current_user && session[:status_user]==1
        redirect_to category_path
      else
        render 'edit'
      end
  end

  private
  def chack_ed
    if session[:user_id]!=current_user && session[:status_user]!=1
      redirect_to home_path
    end
  end
  def category_params
      return params.permit(:name)
  end

  end




