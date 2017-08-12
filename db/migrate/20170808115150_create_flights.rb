class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.datetime :arrival_date
      t.datetime :departure_date

      t.timestamps
    end
  end
end
