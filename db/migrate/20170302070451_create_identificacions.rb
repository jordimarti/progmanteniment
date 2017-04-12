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
      t.string :regim_juridic
      t.string :tipus_identificacio_propietat
      t.string :identificacio_propietat
      t.string :nom_propietat
      t.string :cognoms_propietat
      t.string :tipus_via_propietat
      t.string :adreca_propietat
      t.integer :codi_postal_propietat
      t.string :poblacio_propietat
      t.string :provincia_propietat
      t.string :telefon_propietat
      t.string :email_propietat
      t.string :tipus_identificacio_representant
      t.string :identificacio_representant
      t.string :nom_representant
      t.string :cognoms_representant
      t.string :tipus_via_representant
      t.string :adreca_representant
      t.integer :codi_postal_representant
      t.string :poblacio_representant
      t.string :provincia_representant
      t.string :telefon_representant
      t.string :email_representant
      t.string :nom_tecnic
      t.string :cognoms_tecnic
      t.string :tipus_identificacio_tecnic
      t.string :identificacio_tecnic
      t.string :titulacio_tecnic
      t.string :colegi_tecnic
      t.string :num_colegiat_tecnic
      t.string :tipus_via_tecnic
      t.string :adreca_tecnic
      t.integer :codi_postal_tecnic
      t.string :poblacio_tecnic
      t.string :provincia_tecnic
      t.string :telefon_tecnic
      t.string :email_tecnic

      t.timestamps
    end
  end
end
