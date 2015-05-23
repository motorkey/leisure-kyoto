class AddDateToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :date, :TINYINT
  end
end
