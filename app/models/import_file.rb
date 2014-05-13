class ImportFile < ActiveRecord::Base
  has_many :item_purchases

  mount_uploader :filename, ImportUploader

  def total_revenue
    item_purchases.inject(0) { |sum, x| sum = sum + x.revenue }
  end

  def import!
    import_file = File.open(self.filename.path)
    import_file.each_with_index do |line, line_num|
      next if line_num == 0  # skip header line
      parts = line.split("\t")
      purchaser = Purchaser.where(name: parts[0]).first_or_create
      merchant = Merchant.where(address: parts[4], name: parts[5]).first_or_create
      item = Item.where(merchant: merchant, description: parts[1], price: parts[2].to_f).first_or_create
      item_purchases.create(item: item, purchaser: purchaser, count: parts[3])
    end
    self.imported_at = DateTime.now
    self.save!
  end

end
