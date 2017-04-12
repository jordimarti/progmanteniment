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
      t.integer :import_obres, default: 0
      t.integer :import_honoraris, default: 0
      t.integer :import_taxes, default: 0
      t.integer :import_altres, default: 0
      t.integer :import_total, default: 0
      t.string :responsable

      t.timestamps
    end
  end
end
