class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :sec
      t.string  :sentence
      t.references :bookmark
      t.timestamps
    end
  end
end
