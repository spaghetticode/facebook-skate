class AddRanks < ActiveRecord::Migration
  def self.up
    10.times do |n|
      Rank.create(:name => "#{n+1}", :level => n+1, :next_rank_id => (n == 9 ? nil : n+2), :min_experience => (n * 35))
    end
  end

  def self.down
    Rank.destroy_all
  end
end
