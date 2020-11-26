class CreateBreatsfeedings < ActiveRecord::Migration[5.2]
  def change
    create_table :breatsfeedings do |t|
      t.integer :cantidad
      t.float :tiempo
      t.belongs_to :baby, foreign_key: true

      t.timestamps
    end
  end
end
