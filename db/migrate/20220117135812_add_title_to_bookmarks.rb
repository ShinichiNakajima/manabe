class AddTitleToBookmarks < ActiveRecord::Migration[6.0]
  def change
    add_column :bookmarks, :title, :string
  end
end
