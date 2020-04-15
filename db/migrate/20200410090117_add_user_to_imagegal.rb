class AddUserToImagegal < ActiveRecord::Migration[6.0]
  def change
    add_reference :imagegals, :user, foreign_key: true
  end
end
