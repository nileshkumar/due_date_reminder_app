class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.string :assignee
      t.datetime :due_date
      t.string :status
      t.string :progress
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
