require 'test_helper'

class ImportFileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    #TODO replace this with fixtures
    i = Item.create(price: 144)
    @ip1 = ItemPurchase.create(item: i, count: 1)
    @ip2 = ItemPurchase.create(item: i, count: 3)
  end

  test "total revenue is zero when there are no purchases" do
    assert_equal 0, ImportFile.new.total_revenue
  end

  test "total revenue is summed correctly" do
    import = ImportFile.new
    import.item_purchases << @ip1
    assert_equal 144, import.total_revenue
    import.item_purchases << @ip2
    assert_equal (144 * 4), import.total_revenue
  end

  test "imports an empty file correctly" do
    import = ImportFile.new
    import.file = test_upload("")
    import.import!
    assert_equal 0, import.item_purchases
  end

  test "creates missing purchasers" do
    import = ImportFile.new
    import.file = test_upload("example_input.tab")
    import.import!
    assert_not_nil Purchaser.where(name: "Snake Plissken").first
  end

  test "doesn't duplicate existing purchasers" do
    plissken = Purchaser.create(name: "Snake Plissken")
    import = ImportFile.new
    import.file = test_upload(example_input.tab)
    import.import!
    assert_equal [plissken], Purchaser.where(name: "Snake Plissken").all
  end
end
