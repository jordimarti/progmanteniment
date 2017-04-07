class CreateReferenciaCalendariPreventius < ActiveRecord::Migration[5.0]
  def change
    create_table :referencia_calendari_preventius do |t|
      t.integer :edifici_id
      t.integer :operacio_id
      t.integer :data_any
      t.string :responsable
      t.string :sistema

      t.timestamps
    end
  end
end
