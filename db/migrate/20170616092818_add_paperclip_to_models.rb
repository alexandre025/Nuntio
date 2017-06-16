class AddPaperclipToModels < ActiveRecord::Migration[5.1]
  def change
    add_attachment :towers, :image
    add_attachment :users, :image
    add_attachment :reports, :image
  end
end
