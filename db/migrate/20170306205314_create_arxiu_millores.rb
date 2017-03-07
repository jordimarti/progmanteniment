class CreateArxiuMillores < ActiveRecord::Migration[5.0]
  def change
    create_table :arxiu_millores do |t|
      t.integer :edifici_id

      t.timestamps
    end
  end
end
