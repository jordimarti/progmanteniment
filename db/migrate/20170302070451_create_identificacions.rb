class CreateIdentificacions < ActiveRecord::Migration[5.0]
  def change
    create_table :identificacions do |t|
      t.integer :edifici_id
      t.string :tipus_via
      t.string :nom_via
      t.string :numero_via
      t.string :bloc
      t.integer :codi_postal
      t.string :poblacio
      t.string :provincia

      t.timestamps
    end
  end
end
