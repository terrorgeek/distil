class AddColumnAccountIdToDomain < ActiveRecord::Migration
  def change
    add_column :domains, :account_id, :integer
  end
end
