class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.belongs_to :Events, foreign_key: true
      t.belongs_to :Users, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
