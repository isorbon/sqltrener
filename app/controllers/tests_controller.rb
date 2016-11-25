class TestsController < ApplicationController
  before_action :set_t, only: [:edit,:destroy]

  def new
    @tests=Test.new
  end

  def show

  end

  def edit

  end

  def create
    @tests = Test.new(test_params)
    if @tests.save
      redirect_to tests_path
    else
        render 'new'
    end
  end

  def destroy
    if  @test.destroy
      redirect_to tests_path
    else
      render 'show'
    end
  end


  def update

    if params[:format_id].to_i !=0
      @test = Test.find(params[:format_id])
      if @test.update(test_params)
        redirect_to tests_path
      else
        render 'edit'
      end
    end
 end
  private
  def set_t
    if params[:format].to_i !=0
      @test = Test.find(params[:format])
    end
  end
  def test_params
    sgh= params.permit(:description,:name,:start_t,:password,:active)
    return {description:sgh[:description],name:sgh[:name],start_t:sgh[:start_t],password: encrypt(sgh[:description]),active: sgh[:active]}
  end
end

