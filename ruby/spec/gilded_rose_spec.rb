require File.join(File.dirname(__FILE__), '../lib/gilded_rose')


describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    it "items at the end of the day sell_in loses a value of one" do
      items = [Item.new("foo", 1, 1)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq (0)
    end
    it "items at the end of the day quality decreases by one" do
      items = [Item.new("foo", 1, 1)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq (0)
    end
    it "item once passed sell by date, quality degrades twice as fast" do
      items = [Item.new("foo", -1, 4)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(2)
    end
  end




end
