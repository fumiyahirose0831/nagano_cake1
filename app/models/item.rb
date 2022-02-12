class Item < ApplicationRecord
      attachment :image
      has_many :cart_items, dependent: :destroy
      has_many :oder_details, dependent: :destroy
end
