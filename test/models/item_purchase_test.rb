require 'test_helper'

class ItemPurchaseTest < ActiveSupport::TestCase

  def setup
    i = Item.create(price: 145)
    p = Purchaser.create(name: "A. Person")
    @ip = ItemPurchase.new(item: i, purchaser: p)
  end

  test "revenue is extended correctly" do
    assert_equal @ip.revenue, 0

    @ip.count = 1
    assert_equal @ip.revenue, 145.00

    @ip.count = 2
    assert_equal @ip.revenue, 290.00

    @ip.count = 100
    assert_equal @ip.revenue, 14500.00
  end
end
