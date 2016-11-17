class Product < ApplicationRecord

  def dept_list
    return department.split(", ")
  end

  def pretty_time
    return created_at.strftime("%b %e, %l:%M %p")
  end
end

