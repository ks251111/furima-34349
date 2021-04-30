class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :item

  with_options presence: true do
    validates :text
    validates :user_id
    validates :item_id
  end
end
