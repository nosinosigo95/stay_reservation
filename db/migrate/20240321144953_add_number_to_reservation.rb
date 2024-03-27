class AddNumberToReservation < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :number, :integer
  end
end
