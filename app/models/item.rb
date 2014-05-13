class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :item_purchases

  validates_presence_of :price_in_cents

  def price
    return nil if price_in_cents.nil?
    price_in_cents / 100.0
  end

  def price=(new_price)
    self.price_in_cents = new_price * 100.00
  end

end
