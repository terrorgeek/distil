class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.string :hostname
      t.string :origin_ip
      t.timestamps
    end
  end
end
