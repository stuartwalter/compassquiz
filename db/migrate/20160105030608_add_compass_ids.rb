class AddCompassIds < ActiveRecord::Migration
  def change
    add_column :cohorts, :compass_install, :string
    add_column :cohorts, :compass_id, :integer, index: true
    add_column :activities, :compass_install, :string
    add_column :activities, :compass_id, :integer, index: true
    add_column :students, :compass_install, :string
    add_column :students, :compass_id, :integer, index: true
  end
end