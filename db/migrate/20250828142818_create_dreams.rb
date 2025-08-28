class CreateDreams < ActiveRecord::Migration[8.0]
  def change
    create_table :dreams do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
