class Product < ApplicationRecord

  def dept_list
    return department.split(", ")
  end

  def pretty_time
    return created_at.strftime("%b %e, %l:%M %p")
  end

  def sale_message
    if price.to_i <= 2
      return "Discount Item"
    else
      return "On Sale!"
    end
  end

  def tax
    @tax = price.to_i * 0.09
  end

  def total
    return price.to_i + @tax
  end

end

