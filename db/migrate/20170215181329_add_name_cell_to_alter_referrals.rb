class AddNameCellToAlterReferrals < ActiveRecord::Migration[5.0]
  def change
    add_column :alter_referrals, :name_cell, :string
  end
end

#	Run me after ...
# AlterReferral.all.each{|a| a.update_attribute(:name_cell, [a.first_name,a.last_initial,a.last_4_cell].compact.join(' ').squish ) }
#
