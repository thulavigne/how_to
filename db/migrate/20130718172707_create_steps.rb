class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :title
      t.text :description
      t.references :project

      t.timestamps
    end
    add_index :steps, :project_id
  end
end
