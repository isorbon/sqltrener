class TpublicsController < ApplicationController
  def new
    chack_ed
  end
  def create
    chack_ed
   if  option
      redirect_to admin_path
   else
     render 'new'
    end
  end
  private

  def option
    kat
    taskid=id_task
    $p=0
    (1..params[:count].to_i).each do |i|
      (1..@count_z).each do |j|
        @tes1=Tpublic.new({task_id: taskid[$p] ,test_id: params[:tid], option: i})
        @tes1.save
        $p=$p+1
      end
    end
    return true
  end

  def id_task
    out=[]
    $j=0
    while $j<params[:count].to_i
      out.push(kat)
      $j=$j+1
    end
    out=out.join(',').split(',')
    out=out.collect{|k| k.to_i}
    return out
  end

  def getv_(id)
    return params["id#{id}"]
  end
  def ran(n,k)
    srand
    t=[]
    t=n.sample(k)
    if t.uniq! == nil
      return t
    else
      return n.sample(k)
    end
  end

  def get_(id)
    tl=[]
    tp=Task.joins(:cat).select(:id).group("tasks.id,cats.id").where("cats.id=#{id}")
    tp.each do |cat|
      tl.push(cat.id)
    end
    return tl
  end

  def kat
    out=[]
    @count_z=0
    tp=Cat.joins(:tasks).select(:cat_id).group("cats.id").count("Tasks.id")
    $k=0
    tp.each do |cat|
      out.push(ran(ran(get_(cat[0]),getv_($k.to_s).to_i),getv_($k.to_s).to_i))
      @count_z+=getv_($k.to_s).to_i
      $k+=1
    end
    return out
  end

  def chack_ed
    if session[:user_id]!=nil && current_user[:id]!=nil && session[:status_user]!=1
      redirect_to admin_path
    else
      redirect_to home_path
    end
  end

end











