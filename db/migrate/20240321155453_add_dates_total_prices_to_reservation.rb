class AddDatesTotalPricesToReservation < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :dates, :integer
    add_column :reservations, :total_prices, :integer
  end
end
