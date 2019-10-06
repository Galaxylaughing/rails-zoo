class AddImageColumn < ActiveRecord::Migration[5.2]
  def change
    add_column(:animals, :image, :string)
  end
end
