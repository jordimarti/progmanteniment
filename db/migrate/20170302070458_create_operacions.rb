class CreateOperacions < ActiveRecord::Migration[5.0]
  def change
    create_table :operacions do |t|
      t.integer :edifici_id
      t.integer :fase_id
      t.text :descripcio_ca
      t.text :descripcio_es
      t.decimal :periodicitat
      t.string :periodicitat_text_ca
      t.string :periodicitat_text_es
      t.string :tipus
      t.string :sistema
      t.integer :import_obres
      t.integer :import_honoraris
      t.integer :import_taxes
      t.integer :import_altres
      t.integer :import_total

      t.timestamps
    end
  end
end
