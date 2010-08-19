class CorrectDecisionIdName < ActiveRecord::Migration
  def self.up
    rename_column :datasets_decisions, :descision_id, :decision_id
  end

  def self.down
    rename_column :datasets_decisions, :decision_id, :descision_id
  end
end
