class CreateMerges < ActiveRecord::Migration[5.0]
  def change
    create_table :merges do |t|
      t.string :name

      t.timestamps
    end
  end
end
