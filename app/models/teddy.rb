class Teddy < ApplicationRecord
  belongs_to :category
  monetize :price_fens # or :price_pennies
end
