class AddPublicToImagegal < ActiveRecord::Migration[6.0]
  def change
    add_column :imagegals, :public, :boolean, default: false
  end
end
