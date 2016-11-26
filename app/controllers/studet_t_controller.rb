class StudetTController < ApplicationController
  def new
  @td=tes(6)
  end
  def show

  end
  def tes(id)
    ou=[]
    to=Tpublic.select(:option).distinct.where("test_id=#{id}")
    to.each { |x|  ou.append(x.option)
    }
    td=Task.select("tasks.ask as tasks_ask,tasks.answer as tasks_answer,tasks.mark as tasks_mark,tasks.cat_id as tasks_cat_id,tasks.time as tasks_time").joins(:tpublics).where("tpublics.option =#{ou.sample}")
    return td
  end
end
