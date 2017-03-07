class CreateArxiuCorrectius < ActiveRecord::Migration[5.0]
  def change
    create_table :arxiu_correctius do |t|
      t.integer :edifici_id

      t.timestamps
    end
  end
end
