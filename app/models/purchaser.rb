class Purchaser < ActiveRecord::Base
  has_many :deal_purchases
end
