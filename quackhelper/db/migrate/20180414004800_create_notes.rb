class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.belongs_to :event, foreign_key: true
      t.string :personuser, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
