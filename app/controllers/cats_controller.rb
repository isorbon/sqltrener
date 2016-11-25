class CatsController < ApplicationController
  def show
  end
  def edit
  end
  def create
      @category = Cat.new(category_params)
      if @category.save
        redirect_to category_path
      else
        render 'show'
      end
  end
  def update
    if  dec(params[:formati]).to_i !=0
      @categor = Cat.find(dec(params[:formati]).to_i)
    end
       if @categor.update(category_params)
        redirect_to category_path
      else
        render 'edit'
      end
  end

  def destroy
    if  dec(params[:format]).to_i !=0
      @categor = Cat.find(dec(params[:format]).to_i)
    end
    if @categor.destroy
        redirect_to category_path
      else
        render 'edit'
      end
  end

  private
   def category_params
      return params.permit(:name)
   end


  end




