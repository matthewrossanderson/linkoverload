class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.string :submitter
      t.text :description

      t.timestamps
    end
  end
end
