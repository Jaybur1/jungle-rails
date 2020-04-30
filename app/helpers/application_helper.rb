module ApplicationHelper
  def active_sale
    Sale.active.any? ? Sale.active[0] : false
  end
end
