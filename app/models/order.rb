class Order < ApplicationRecord
  monetize :amount_fens # or :amount_pennies
end
