class AddTricks < ActiveRecord::Migration
  def self.up
    [['tip tap', 'ollie', 'manual'], ['frontside ollie', 'backside ollie', 'varial'], ['flip', 'nollie', 'heel flip'], ['backside flip', '360 flip', 'frontside flip']].each_with_index do |arr, n|
      arr.each do |name|
        Trick.create!(:name => name, :rank_id => n+1, :difficulty => n+1)
      end
    end
  end

  def self.down
    Trick.destroy_all
  end
end
