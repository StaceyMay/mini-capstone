class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images  
  has_many :orders
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :carted_products
  has_many :orders, through: :carted_products


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

  def stock_value
    if stock == true
      return "In Stock!!"
    else
      return "Sorry, out of stock!"
    end
  end

end
