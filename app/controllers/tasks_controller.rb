class TasksController < ApplicationController
  before_action :set_tasks, only: [:edit,:destroy]
  def new
    @tabnam=''
  end
  def show

  end
  def edit

  end
  def create
    @tasks = Task.new(task_params)
      if  @tasks.save
        redirect_to taskl_path
      else
        render 'new'
    end
  end

  def update
    if  dec(params[:formati]).to_i !=0
      @tasks =Task.find(dec(params[:formati]).to_i)
    end
    if  @tasks.update(task_params)
      redirect_to taskl_path
    else
      render 'new'
    end
  end

  def destroy
    if @tasks.destroy
      redirect_to taskl_path
    else
      render 'new'
    end
  end

  private
  def set_tasks
       if  dec(params[:format]).to_i !=0
         @tasks =Task.find(dec(params[:format]).to_i)
       end
        rescue ActiveRecord::RecordNotFound
    redirect_to  taskl_path
  end
    def task_params
      sgh= params.permit(:ask,:code,:mark,:cat_id,:time)
      return {ask: sgh[:ask],answer:sgh[:code],mark:sgh[:mark],cat_id: sgh[:cat_id],user_id: current_user[:id],time: sgh[:time] }
    end
end
