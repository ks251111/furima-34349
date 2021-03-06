class Item < ApplicationRecord
  belongs_to :user
  has_one :buy
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :reports

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :area
  belongs_to :day

  with_options presence: true do
    validates :image
    validates :title
    validates :text
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :area_id
    validates :day_id
  end

  validates :price, numericality: { allow_nil: true }

  validates :price, inclusion: { in: 300..9_999_999 }

  def self.search(search)
    if search != ""
      Item.where('text LIKE(?) OR title LIKE(?)', "%#{search}%", "%#{search}%")
    else
      Item.all
    end
  end

  def liked_by(user)
    Like.find_by(user_id: user.id, item_id: id)
  end
end
