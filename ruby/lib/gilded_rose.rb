class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
        if item.quality > 0
          if item.name != "Sulfuras, Hand of Ragnaros"
            item.quality = item.quality - 1
          end
        end
      else
        item_quality_increment(item)
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < 11
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
            if item.sell_in < 6
              item_quality_increment(item)
            end
          end
      end

      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in = item.sell_in - 1
      end

      if item.sell_in < 0
        backstage_pass_no_longer_sellable(item)
        if item.name == "Aged Brie"
          item_quality_increment(item)
        end
        if not_special_items(item)
              quality_decrease(item)
        end


      end
    end
  end
end

def not_special_items(item)
  item.name != "Backstage passes to a TAFKAL80ETC concert"
  item.name != "Sulfuras, Hand of Ragnaros"
end

def quality_decrease(item)
  item.quality -= 1 if item.quality > 0
end

def backstage_pass_no_longer_sellable(item)
  item.quality = 0 if item.name == "Backstage passes to a TAFKAL80ETC concert"
end

def item_quality_increment(item)
  item.quality +=1 if item.quality < 50
end

#move into it's own file
class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
