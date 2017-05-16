class CreateReferenciaCalendariOperacions < ActiveRecord::Migration[5.0]
  def change
    create_table :referencia_calendari_operacions do |t|
      t.integer :edifici_id
      t.integer :operacio_id
      t.text :descripcio
      t.string :sistema
      t.integer :data_any
      t.integer :data_mes

      t.timestamps
    end
  end
end
