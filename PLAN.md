
Merchant address, name
Item belongs_to merchant, price_in_cents, description
[ ] price, price=
ItemPurchase belongs_to purchaser, belongs_to item, count
[ ] revenue
Purchaser name, has_many :deal_purchases

ImportFile has_many :deal_purchases
[ ] total_revenue
[ ] import!

