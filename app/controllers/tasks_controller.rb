class TasksController < ApplicationController
  def new
    chack_ed
    @tabnam=''
  end
  def show
    chack_ed
  end
  def edit
    chack_ed
  end
  def create
    chack_ed
    @tasks = Task.new(task_params)
    if  @tasks.save&&[:status_user]== 1
        redirect_to taskl_path
      else
        render 'new'
    end
  end

  def update
    chack_ed
    @tasks = Task.find(params[:lenhy])
    if  @tasks.update(task_params)&&[:status_user]== 1
      redirect_to taskm_path
    else
      render 'new'
    end
  end

  def destroy
    if Task.delete(params[:format])&&[:status_user]== 1
      redirect_to taskm_path
    end
  end

  private
  def chack_ed
    if session[:user_id]!=current_user && session[:status_user]!=1
      redirect_to home_path
    end
  end

  def task_params
    sgh= params.permit(:ask,:code,:mark,:cat_id,:time)
    return {ask: sgh[:ask],answer:sgh[:code],mark:sgh[:mark],cat_id: sgh[:cat_id],user_id: session[:user_id],time: sgh[:time] }
  end
end
