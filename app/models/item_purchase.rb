class ItemPurchase < ActiveRecord::Base
  belongs_to :item
  belongs_to :purchaser
  belongs_to :import_file
end
