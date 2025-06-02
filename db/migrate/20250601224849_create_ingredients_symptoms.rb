class CreateIngredientsSymptoms < ActiveRecord::Migration[7.2]
  def change
    create_table :s do |t|
      t.references :ingredient, null: false, foreign_key: true
      t.references :symptom, null: false, foreign_key: true

      t.timestamps
    end
  end
end
