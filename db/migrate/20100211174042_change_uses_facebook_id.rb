class ChangeUsesFacebookId < ActiveRecord::Migration
  def self.up
    if ActiveRecord::Base.connection.adapter_name =~ /postgres/i
      ActiveRecord::Migration.execute "alter table users alter column facebook_id type bigint"
    end
  end

  def self.down
  end
end
