class CreateImagegals < ActiveRecord::Migration[6.0]
  def change
    create_table :imagegals do |t|
      t.string :title
      t.text :caption
      
      t.timestamps
    end
  end
end
