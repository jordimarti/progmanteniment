class CreateArxius < ActiveRecord::Migration[5.0]
  def change
    create_table :arxius do |t|
      t.integer :edifici_id

      t.timestamps
    end
  end
end
