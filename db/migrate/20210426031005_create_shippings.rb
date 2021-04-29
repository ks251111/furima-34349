class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string     :postal,   null: false
      t.integer    :area,     null: false
      t.string     :city,     null: false
      t.string     :address,  null: false
      t.string     :build
      t.string     :tel,      null: false
      t.references :buy,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
