class RemoveDateFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :date, :int
  end
end
