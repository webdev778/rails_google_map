class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :request_number
      t.integer :sequence_number
      t.string :request_type
      t.datetime :response_due_date_time
      t.string :sacode1
      t.string :sacode2
      t.string :company_name
      t.string :address
      t.boolean :crew_on_site
      t.text :well_know_text
      t.timestamps
    end
  end
end
