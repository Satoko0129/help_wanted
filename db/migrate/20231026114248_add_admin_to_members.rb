class AddAdminToMembers < ActiveRecord::Migration[6.1]
  def change
    add_reference :members, :admin, foreign_key: true
  end
end
