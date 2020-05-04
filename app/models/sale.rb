class Sale < ActiveRecord::Base

  validates :name, presence: true
  validates :percent_off, presence: true, numericality: true {greater_than_or_equal_to: 1, ess_than_or_equal_to: 95}
  validates :starts_on, presence: true
  validates :ends_on, precense: true

  def self.active
    self.where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current)
  end

  def finished?
    self.ends_on < Date.current 
  end

  def upcoming?
    self.starts_on > Date.current 
  end

  def active?
    !upcoming? && !finished?
  end

end
