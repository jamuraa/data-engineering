class WelcomeController < ApplicationController
  def index
    @import_file_count = ImportFile.count
    @import_file_total = ImportFile.total_revenue
    @purchasers_count = Purchaser.count
    @merchants_count = Merchant.count
    @items_count = Item.count
  end
end
