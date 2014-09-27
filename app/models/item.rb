class Item < ActiveRecord::Base
  belongs_to :item_type
  belongs_to :project
  has_many :item_datas
end
