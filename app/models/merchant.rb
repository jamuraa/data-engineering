class Merchant < ActiveRecord::Base
  has_many :items
  has_many :item_purchases, through: :items
end
