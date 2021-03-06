require File.join(File.dirname(__FILE__), '../lib/gilded_rose')


describe GildedRose do
  before do
    @items = [Item.new("foo", 0, 0), Item.new("foo", 1, 1), Item.new("foo", -1, 4), Item.new("Aged Brie", 3, 3),
    Item.new("Aged Brie", 5, 50), Item.new("Sulfuras, Hand of Ragnaros", 1, 10), Item.new("Backstage passes to a TAFKAL80ETC concert", 12, 5),
    Item.new("Backstage passes to a TAFKAL80ETC concert", 9, 12), Item.new("Backstage passes to a TAFKAL80ETC concert", 4, 10),
    Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 20)]
    GildedRose.new(@items).update_quality()
  end
  describe "#update_quality" do

    it "does not change the name" do
      expect(@items[0].name).to eq "foo"
    end

    it "items at the end of the day sell_in loses a value of one" do
      expect(@items[1].sell_in).to eq (0)
    end

    it "items at the end of the day quality decreases by one" do
      expect(@items[1].quality).to eq (0)
    end

    it "item once passed sell by date, quality degrades twice as fast" do
      expect(@items[2].quality).to eq(2)
    end

    it "quality of an item is never negative" do
      expect(@items[0].quality).to eq(0)
    end

    it "aged brie increase quality as sell in decreases" do
      expect(@items[3].quality).to eq(4)
    end

    it "never exceeds a quality value greater than 50" do
      expect(@items[4].quality).to eq(50)
    end

    it "sulfuras being a legendary never decreases in quality" do
      expect(@items[5].quality).to eq(10)
    end

    it "sulfuras being a legendary never decreases in quality" do
      expect(@items[5].sell_in).to eq(1)
    end

    it "Backstage Passes quality increases by 1 if sell_in value is greater than 10" do
      expect(@items[6].quality).to eq(6)
    end
    it "Backstage Passes quality increase by 2 if sell_in value is less than or equal to 10 and greater than 5" do
      expect(@items[7].quality).to eq(14)
    end

    it "Backstage Passes quality increase by 3 if sell_in value is less than or equal to 5" do
      expect(@items[8].quality).to eq(13)
    end

    it "Backstage passes quality is 0 when sell_in hits a negative" do
      puts @items[9]
      expect(@items[9].quality).to eq(0)
    end

  end
end
