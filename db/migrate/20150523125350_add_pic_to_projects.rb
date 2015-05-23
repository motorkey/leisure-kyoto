class AddPicToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :pic, :string
  end
end
