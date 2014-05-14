require 'test_helper'

class ImportFileTest < ActiveSupport::TestCase

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

  def upload_file(filename)
    src = File.join(Rails.root, "test/fixtures/" + filename)
    File.new(src)
  end

  def import_with_file(name)
    ImportFile.new.tap do |import|
      import.filename = upload_file(name)
      import.import!
    end
  end

  test "imports an empty file correctly" do
    import = import_with_file("empty_file.tab")
    assert_equal 0, import.item_purchases.count
  end

  test "creates missing purchasers" do
    import_with_file("example_input.tab")
    assert_not_nil Purchaser.where(name: "Snake Plissken").first
  end

  test "doesn't duplicate existing purchasers" do
    plissken = Purchaser.create(name: "Snake Plissken")
    import_with_file("example_input.tab")
    assert_equal [plissken], Purchaser.where(name: "Snake Plissken").all
  end

  test "imports the right number of items" do
    import = import_with_file("example_input.tab")
    assert_equal 4, import.item_purchases.count
  end

  test "total revenue imported is the right amount" do
    import = import_with_file("example_input.tab")
    assert_equal 95, import.total_revenue
  end


  test "class can add up global total revenue: starts at zero" do
    assert_equal 0, ImportFile.total_revenue
  end

  test "class can add up global total revenue: works" do
    import_with_file("example_input.tab")
    import_with_file("example_input.tab")
    assert_equal 190, ImportFile.total_revenue
  end
end
