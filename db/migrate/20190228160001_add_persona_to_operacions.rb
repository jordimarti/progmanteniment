class AddPersonaToOperacions < ActiveRecord::Migration[5.0]
  def change
  	add_column :operacions, :persona, :string
  end
end
