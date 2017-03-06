class CreatePreventius < ActiveRecord::Migration[5.0]
  def change
    create_table :preventius do |t|
      t.integer :edifici_id
      t.text :descripcio_ca
      t.text :descripcio_es
      t.decimal :periodicitat
      t.string :periodicitat_text_ca
      t.string :periodicitat_text_es
      t.string :document_referencia
      t.string :responsable_ca
      t.string :responsable_es
      t.boolean :obligatorietat
      t.boolean :manual_habitatge
      t.boolean :creat_usuari
      t.string :sistema

      t.timestamps
    end
  end
end
