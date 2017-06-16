class AddSocialLinks < ActiveRecord::Migration[5.1]
  def change
    add_column :tower_guards, :link_to_facebook, :string
    add_column :tower_guards, :link_to_twitter, :string
    add_column :tower_guards, :link_to_angellist, :string
    add_column :tower_guards, :link_to_google, :string
    add_column :tower_guards, :link_to_linkedin, :string
  end
end
