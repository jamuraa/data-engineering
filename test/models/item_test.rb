require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "price sets the cents correctly" do
    i = Item.new
    i.price = 123.45
    assert_equal 12345, i.price_in_cents
  end

  test "price is nil for new items" do
    assert_nil Item.new.price
  end

  test "display price is in dollars" do
    i = Item.new(price_in_cents: 12345)
    assert_equal 123.45, i.price
  end

  test "can mass-assign the price" do
    i = Item.new(price: 145)
    assert_equal i.price, 145.00
  end

end
