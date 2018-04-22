class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.datetime :start_time
      t.string :assignment
      t.string :subject
      
      t.timestamps
    end
  end
end
