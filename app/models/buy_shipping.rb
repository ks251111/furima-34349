class BuyShipping
  include ActiveModel::Model
  attr_accessor :postal, :area_id, :city, :address, :build, :tel, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal
    validates :city
    validates :address
    validates :tel
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :area_id, numericality: {other_than: 1}

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Shipping.create(postal: postal, area: area_id, city: city, address: address, build: build, tel: tel, buy_id: buy.id)
  end
end