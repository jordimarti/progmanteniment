class AddCreadorToEdificis < ActiveRecord::Migration[5.0]
  def change
  	add_column :edificis, :creador, :string
  	add_column :edificis, :editor_correu, :string
  	add_column :edificis, :editor_nif, :string
  end
end
