class ItemPurchase < ActiveRecord::Base
  belongs_to :item
  belongs_to :purchaser
  belongs_to :import_file

  validates_presence_of :item
  validates_presence_of :purchaser

  def revenue
    return 0 if count.nil?
    count * item.price
  end
end
