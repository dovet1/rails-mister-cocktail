class AddNameAndForeignKeysToDose < ActiveRecord::Migration[5.2]
  def change
    add_column :doses, :description, :string
    add_reference :doses, :ingredient
    add_reference :doses, :cocktail
  end
end
