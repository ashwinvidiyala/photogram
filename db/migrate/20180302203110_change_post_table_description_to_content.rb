class ChangePostTableDescriptionToContent < ActiveRecord::Migration[5.1]
  def change
    rename_column :posts, :description, :content
  end
end
