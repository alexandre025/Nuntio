class AddReadTimeToReports < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :read_time, :integer
  end
end
