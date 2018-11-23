class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :time
      t.string :content
      t.string :image 
      t.string :lat
      t.string :lng
      t.integer :user_id
      t.integer :category
      t.string :username
      t.string :address
      t.string :price

      t.string :start_date           
      t.string :end_date   
      # t.string :year,               null: false, default: ""
      # t.string :month,              null: false, default: ""
      # t.string :day,                null: false, default: ""
      # t.string :hour,               null: false, default: ""
      # t.string :minute,             null: false, default: ""
      # t.string :sale_hour,          null: false, default: ""
      # t.string :sale_minutes,       null: false, default: ""
      # t.string :sale_hour_2,        null: false, default: ""
      # t.string :sale_minutes_2,     null: false, default: ""
    

      t.timestamps null: false
    end
  end
end
