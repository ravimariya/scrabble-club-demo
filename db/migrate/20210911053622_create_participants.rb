class CreateParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :participants do |t|
      t.float :score
      t.string :result
      t.references :member, foreign_key: true
      t.references :game, foreign_key: true
      t.timestamps
    end
  end
end
