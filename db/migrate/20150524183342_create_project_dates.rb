class CreateProjectDates < ActiveRecord::Migration
  def change
    create_table :project_dates do |t|
      t.string :date
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
