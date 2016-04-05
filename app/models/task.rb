class Task < ActiveRecord::Base

  def Task.slide_down(place)
    tasks = Task.order(:position)
    skips = 0
    tasks.each do |task|
      skips += 1
      binding.pry
      if skips >= place
        task.position += 1
      end
    end
  end

  def Task.slide_up

  end

end
